import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/main_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen  extends StatelessWidget {
  const ChatScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scaffold la base de toda la aplicación
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.fcix3-1.fna.fbcdn.net/v/t39.30808-6/406451505_719311307002630_2262556868658864840_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=127cfc&_nc_ohc=N0D5-MECEKIQ7kNvgE-Yo1N&_nc_oc=AdiLkTI957FM8oy3Ve-ad_rUgvTjYROox_st9yomxNsdWyFjk0hkVSaEqYA2XVDbD9g&_nc_zt=23&_nc_ht=scontent.fcix3-1.fna&_nc_gid=AxjDpkt9pBwzhGeUdTWHxxL&oh=00_AYAMF8SdNP6OUTCi9-XivGB8QrpG-Vz_BxsCNgSELMZd9A&oe=677D0ECC'),
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
    return SafeArea( //SafeArea se utiliza para asegurarse de que el contenido de la interfaz de usuario no se superponga con las áreas restringidas del dispositivo
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column( //
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                    ?  const MyMessageBubble()
                    : const HerMessageBubble();
              },),
            ),
            //Todo : Input para escribir mensaje
            MessageFieldBox(),
          ],
        ),
      ),
    ); //Como un div, con sus propiedades background, width etc
  }
}

