import 'package:fitness_app/screens/homepage.dart';
import 'package:fitness_app/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  SignIn({
    super.key,
  });

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void login() async {
    setState(() {});
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((value) {
      Utils().toastMessage(value.user!.uid.toString());
      Utils().toastMessage("Login Successful");

      //Navigator.pushNamed(context, '/homepage');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (Context) =>
                  HomePage(userName: value.user!.email.toString())));
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

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
                  child: TextField(
                    controller: emailcontroller,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
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
                  child: TextField(
                    controller: passwordcontroller,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "password"),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text("Submit")),
        ],
      ),
    );
  }
}
