import 'package:fitness_app/screens/pdp.dart';
import 'package:fitness_app/screens/registerUser.dart';
import 'package:fitness_app/screens/signin.dart';
import 'package:fitness_app/widgets/gridlayout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final heightinchController = TextEditingController();

  final List<Option> _option = options;
  @override
  Widget build(BuildContext context) {
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
                                child: const Text("Register User"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterUser()));
                                },
                              ),
                              InkWell(
                                child: const Text("sign In"),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignIn()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const Text("Fitness App"),
                        const Text("what brings you to healthy me?")
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
                          child: GridView.builder(
                              itemCount: options.length,
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
                                        builder: (context) => ProductDetails(
                                          text: _option[index].name,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(_option[index].name),
                                  ),
                                );
                              }),
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
                                        controller: ageController,
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "age"),
                                      ),
                                    ),
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
                              const Padding(
                                padding: EdgeInsets.only(top: 3.0),
                                child: SizedBox(
                                  height: 25,
                                  width: 100,
                                  child: ElevatedButton(
                                      onPressed: null,
                                      child: Text("calculate")),
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
