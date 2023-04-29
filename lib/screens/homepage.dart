import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/provider/BMIprovider.dart';
import 'package:fitness_app/screens/firestorecollection.dart';
import 'package:fitness_app/screens/pdp.dart';
import 'package:fitness_app/screens/registerUser.dart';
import 'package:fitness_app/screens/signin.dart';
import 'package:fitness_app/widgets/colosconst.dart';
import 'package:fitness_app/widgets/gridlayout.dart';
import 'package:fitness_app/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  String userName = "hello";
  HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final heightinchController = TextEditingController();
  int bmiVal = 0;
  int x = 10;

  final List<Option> _option = options;

  // void _incrementCounter() {
  //   setState(() {
  //     bmiVal = int.parse(heightController.text) + int.parse(ageController.text);
  //     heightController.clear();
  //     ageController.clear();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    final _auth = FirebaseAuth.instance;

    final loginUser = _auth.currentUser;

    final fireStore =
        FirebaseFirestore.instance.collection('product').snapshots();
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    height: 250,
                    color: Color.fromARGB(255, 9, 78, 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: const Text(
                                  "Register User",
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterUser()));
                                },
                              ),
                              InkWell(
                                child: const Text(
                                  "sign In",
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()),
                                  );
                                },
                              ),
                              InkWell(
                                child: const Text(
                                  "sign out",
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                                onTap: () {
                                  _auth
                                      .signOut()
                                      .then((value) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage(userName: "user")),
                                          ));
                                },
                              ),
                              InkWell(
                                child: const Text(
                                  "Adming",
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                                onTap: () {
                                  _auth
                                      .signOut()
                                      .then((value) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FireStoreCollection()),
                                          ));
                                },
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Fitness App",
                          style: TextStyle(color: AppColors.textColor),
                        ),
                        const Text(
                          "what brings you to healthy me?",
                          style: TextStyle(color: AppColors.textColor),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Welcome ${widget.userName}",
                          style: const TextStyle(color: AppColors.textColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.only(
                          top: 200.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreamBuilder<QuerySnapshot>(
                            stream: fireStore,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text("Some error");
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              return GridView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                  ),
                                  itemBuilder: (BuildContext context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(
                                              text: snapshot.data!
                                                  .docs[index]['productname']
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          snapshot
                                              .data!.docs[index]['productname']
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        )),
                  ),
                ],
              ),
              Positioned(
                  top: 200,
                  left: 40,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(221, 182, 179, 179),
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                            ),
                          ]),
                      child: Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                          child: Column(
                            children: [
                              const Text("Calculate your BMI"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text("Age :   "),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 30,
                                      width: 100,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: ageController,
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "age"),
                                      ),
                                    ),
                                    Consumer<BmiProvider>(
                                        builder: (context, value, child) {
                                      return Text(
                                          "   Your BMI is : ${value.bmiVal}");
                                    }),
                                    // Text(
                                    //   bmiVal.value.toString();
                                    // )
                                  ],
                                ),
                              ),
                              Row(
                                children: const [
                                  Text("Gender: "),
                                  Radio(
                                      value: true,
                                      groupValue: "groupValue",
                                      onChanged: null),
                                  Text("Male"),
                                  Radio(
                                      value: false,
                                      groupValue: "groupValue",
                                      onChanged: null),
                                  Text("Female"),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Height: "),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 30,
                                    width: 100,
                                    child: TextFormField(
                                      controller: heightController,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "feet"
                                          // hintText: 'age',
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 30,
                                      width: 100,
                                      child: TextFormField(
                                        controller: heightinchController,
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "inch"
                                            // hintText: 'age',
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    const Text("weight: "),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 30,
                                      width: 100,
                                      child: TextFormField(
                                        controller: weightController,
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "kgs"
                                            // hintText: 'age',
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: SizedBox(
                                  height: 25,
                                  width: 100,
                                  child: ElevatedButton(
                                      onPressed: (() async {
                                        if (loginUser != null) {
                                          bmiProvider.BMICalculator(
                                              ageController.text,
                                              heightController.text);
                                          ageController.clear();
                                          heightController.clear();
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignIn())).onError(
                                              (error, stackTrace) => Utils()
                                                  .toastMessage(
                                                      error.toString()));
                                        }
                                      }),
                                      child: const Text("Submit")),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))),
            ],
          ),
        ],
      )),
    );
  }
}
