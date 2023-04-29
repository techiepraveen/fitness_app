import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _firestore = FirebaseFirestore.instance;
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  final _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text("Username : "),
              Container(
                //height: 100,
                //color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: usernameController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Username"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text("Email : "),
                Container(
                  //height: 100,
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    controller: emailController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Email"),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Text("Password : "),
              Container(
                //height: 100,
                //color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                _auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
                passwordController.clear();
                emailController.clear();
              },
              child: const Text("Submit")),
        ],
      ),
    );
  }
}
