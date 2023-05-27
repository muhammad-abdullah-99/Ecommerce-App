// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/HomeView.dart';
import 'package:myapp/view/SigninScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController LoginEmailController = TextEditingController();
  TextEditingController LoginPasswordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 280,
              child: Lottie.asset("assets/107513-login (1).json"),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: LoginEmailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  obscureText: obscureText,
                  obscuringCharacter: '*',
                  controller: LoginPasswordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      border: const OutlineInputBorder()),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var loginEmail = LoginEmailController.text.trim();
                  var loginpassword = LoginPasswordController.text.trim();
                  final User? FirebaseUser = (await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: loginEmail, password: loginpassword))
                      .user;
                  if (FirebaseUser != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                  } else {
                    print("Check your email &npassword");
                  }
                },
                child: const Text('Login')),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninScreen()));
                },
                child: Container(
                  child: const Card(
                    child: Text("Don't have an account Singup"),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
