import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:live_chat/screens/chat_screen.dart';
import 'package:live_chat/screens/login_screen.dart';
import 'package:live_chat/screens/registration_screen.dart';
import 'package:live_chat/screens/welcome_screen.dart';

import '../FireBaseInfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: projectApiKey,
      appId: projectAppId,
      messagingSenderId: projectSenderId,
      projectId: projectId,
    ),
  );
  runApp(LiveChat());
}

class LiveChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
