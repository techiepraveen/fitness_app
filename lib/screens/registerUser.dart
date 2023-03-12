import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
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
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
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
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
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
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                ),
              ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Submit")),
        ],
      ),
    );
  }
}
