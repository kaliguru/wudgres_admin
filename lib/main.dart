import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'View/Screens/SplashScreen/SplashScreen.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCoTedYWvsePC7PhDSdsLCyzznNsUjPjgc",
        appId: "1:413461563501:web:253d8a39a6e55145c19764",
        messagingSenderId: "413461563501",
        projectId: "wudgres-admin"),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
