import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                const Text("Username/Email : "),
                Container(
                  //height: 100,
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username/Email"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 52.0, top: 8.0, bottom: 8.0),
            child: Row(
              children: [
                const Text("Password : "),
                Container(
                  //height: 100,
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "password"),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Submit")),
        ],
      ),
    );
  }
}
