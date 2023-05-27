// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/loginScreen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController UserNameController = TextEditingController();
  TextEditingController UserEmailController = TextEditingController();
  TextEditingController UserPasswordController = TextEditingController();

  bool obscureText = true;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "SignIn",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 220,
                child: Lottie.asset("assets/107513-login (1).json"),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: UserNameController,
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder()),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: UserEmailController,
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
                    controller: UserPasswordController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password),
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
                  onPressed: () {
                    var UserName = UserNameController.text.trim();
                    var UserEmail = UserEmailController.text.trim();
                    var UserPassword = UserPasswordController.text.trim();

                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: UserEmail, password: UserPassword)
                        .then((value) => {
                              print("User Created"),
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(
                                    // currentUser!.uid
                                  )
                                  .set({
                                'username': UserName,
                                'useremail': UserEmail,
                                'CreatedAt': DateTime.now(),
                                // 'UserId': currentUser!.uid
                              }).then((value) =>
                                      FirebaseAuth.instance.signOut()),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen())),
                              print('Data stored')
                            });
                  },
                  child: const Text('SignIn')),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: const Card(
                      child: Text("Already have an account"),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
