import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
    final Message message;
    const HerMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //esto coloca el contenido de la columna a la derecha
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5), //Esto genera un espacio entre cada contenido de la columna
        //Todo : img
        _ImageBubble(imagUrl: message.imagUrl!),
        const SizedBox(height: 10,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imagUrl ;

  const _ImageBubble({required this.imagUrl});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //Me optiene las dimensiones del dipositivo
    return ClipRRect(
    borderRadius: BorderRadius.circular(20), 
    child: Image.network(imagUrl, //cargo imagenes desde internet
    width: size.width * 0.7,
    height: 150,
    fit: BoxFit.cover,
    loadingBuilder:(context, child, loadingProgress) {
      //con esto colocamos loading mientras se carga la imagen
      if(loadingProgress == null) return child;

      return Container(
        width: size.width * 0.7,
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: const Text('Mi amor esta enviando una imagen'),
      );
    },
    ));
  }
}