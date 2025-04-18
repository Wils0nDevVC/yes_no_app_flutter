import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    //Con esto obtenemos los valores del texto escrito en el input
    final textController = TextEditingController();

    //FocusNode : me retirene activo o inactivo el focus de mi caja de texto (lo mantiene abierto o cerrado)
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    var inputDecoration = InputDecoration(
        hintText: 'Termina tu mensaje con un "?" ',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            //Aqui obtenemos el valor del texto al presionar el icono
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        ));

    return TextFormField(
      onTapOutside: (event){ //onTapOutside : cuando le hago click fuera de la caja de texto
        focusNode.unfocus(); //unfocus me cierra la caja de texto
      },
      focusNode : focusNode,
      controller: textController,
      decoration: inputDecoration,
      //onFieldSubmitted : es al precionar el boton envíar del teclado del celular. 
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus(); //requestFocus : mantiene activo la caja de texto y el foco activo(no me cierra el teclado)
        onValue(value);

      },
      //onChanged : captura el valor que se va escribiendo desde el teclado
      // onChanged:(value) {
      //   print('changed: $value');
      // },
    );
  }
}
