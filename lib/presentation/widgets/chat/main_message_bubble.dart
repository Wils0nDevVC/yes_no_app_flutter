import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {

    final Message message;
    const MyMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {

    //Busca el tema dentro del contexto global
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, //esto coloca el contenido de la columna a la derecha
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), //pading del mensaje de texto
            child: Text(message.text, style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 10), //Esto genera un espacio entre cada contenido de la columna
      ],
    );
  }
}