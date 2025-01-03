import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {


    final textController = TextEditingController();
    final focusNode = FocusNode(); //FocusNode : me retirene activo o inactivo el focus de mi caja de texto (lo mantiene abierto o cerrado)


    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    var inputDecoration = InputDecoration(
        hintText: 'End your message with a "??" ',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('button : $textValue');
            textController.clear();
          },
        ));

    return TextFormField(
      onTapOutside: (event){ //onTapOutside : cuando le hago click fuera de la caja de texto
        focusNode.unfocus(); //unfocus me cierra la caja de texto
      },
      focusNode : focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus(); //requestFocus : mantiene activo la caja de texto
      }
    );
  }
}
