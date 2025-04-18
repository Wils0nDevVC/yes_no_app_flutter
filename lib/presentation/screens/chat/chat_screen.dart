import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/main_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold la base de toda la aplicación
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://scontent.fcix3-1.fna.fbcdn.net/v/t39.30808-6/482019714_1026703289596762_5741430292397667188_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=127cfc&_nc_ohc=EZ7Sqn194VoQ7kNvwFM-OOu&_nc_oc=AdkrxAcNo_aA6gFMcYeFR7-fwpVSIPZxSxun3kLLeR-RAG9LSQ2jHx0lYfowWxqKzho&_nc_zt=23&_nc_ht=scontent.fcix3-1.fna&_nc_gid=8wGP0jI-BXbn_RmuFZJvgA&oh=00_AfFl-i7x0MU484WQ49sVrGv580IeI_LCFQO2rsgyrPqvFw&oe=68068D28'),
          ),
        ),
        title: Text('Mi amor ❤️'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      //SafeArea se utiliza para asegurarse de que el contenido de la interfaz de usuario
      // no se superponga con las áreas restringidas del dispositivo
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          //
          children: [
            Expanded(
              //ListView.builder es una versión optimizada de ListView.
              //En lugar de construir todos los widgets de una sola vez,
              //los va creando a medida que son visibles en pantalla (como un scroll infinito 🔄).
              child: ListView.builder(
                //Listview me proporciona un control de tipo ScrollController, cualquier elemento 
                //que tenga un scroll trabaja de la misma manera
                controller: chatProvider.chatScrollController, //este me permite obtener el control del scroll
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];
                  return (message.fromWho == FromWho.hers)
                      ?  HerMessageBubble(message: message)
                      :  MyMessageBubble(message: message);
                },
              ),
            ),
            //Todo : Input para escribir mensaje
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    ); //Como un div, con sus propiedades background, width etc
  }
}
