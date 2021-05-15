import 'package:fake_news/screens/authentification.dart';
import 'package:fake_news/screens/signup.dart';
import 'package:fake_news/screens/homepage.dart';
import 'package:fake_news/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fake_news/providers/ModelHud.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
          create: (context) => ModelHud(),
        ),
      ],
      child: MaterialApp(
          initialRoute: Splashscreen.id,
          debugShowCheckedModeBanner: false,
          routes: {
            Splashscreen.id: (context) => Splashscreen(),
            Authentification.id: (context) => Authentification(),
            Signup.id: (context) => Signup(),
            Homepage.id: (context) => Homepage(),
          }),
    );
  }
}
