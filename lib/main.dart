
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/HomeView.dart';
import 'package:myapp/loginScreen.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);               

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  User? user;
  @override
  void initState() {
    
    super.initState();
  user =FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user!=null? const HomeView():const LoginScreen()
    );
  }
}

