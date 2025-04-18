import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //!Provider (estado global): 
    //Para hacer uso de nuestro estado global (ChatProvider), en toda la apliación
    //lo configuramos en nuestro main (nivel más superior), envolvemos nuestro MaterialApp
    //en nuevo Widget MultiProvider, y listamos nuestros providers creados "ChatProvider", 
    //de esta forma todos los hijos tienen acceso al provider. 
    return MultiProvider(
      providers: [
        //si no usamos el contexto usamos el "_"
        ChangeNotifierProvider(create: (_)=>ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: ChatScreen(),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Yes No App'),
        //     backgroundColor: Colors.green[800],
        //     titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        //     centerTitle: true,
        //   ),
        //   body:  Center(
        //     child: FilledButton.tonal(
        //       onPressed: (){}, 
        //       child: Text('Click me')
        //       ),
        //   ),
        // ),
      ),
    );
  }
}