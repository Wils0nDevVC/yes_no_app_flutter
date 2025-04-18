

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  //al crear mi scrooll aqui, esto queda vinculado con mi chat 
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [ 
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  //!Promesa void
  Future<void> sendMessage(String text) async {
    /// TODO implementar método
    if( text.isEmpty ) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')){
      herReply();
    }

    notifyListeners();
    //lo que hace es que cada vez que hay un mensaje mi scroll es notificado
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getYesNoAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    //generamos un delayed para que se ejecute la animateTo 1segundo despues
    await Future.delayed(const Duration(milliseconds: 100 ));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, //esto le dirá que valla a lo maximo que el scroll puede dar 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
  }



}