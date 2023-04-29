import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/widgets/utils.dart';
import 'package:flutter/material.dart';

class FireStoreCollection extends StatefulWidget {
  const FireStoreCollection({super.key});

  @override
  State<FireStoreCollection> createState() => _FireStoreCollectionState();
}

class _FireStoreCollectionState extends State<FireStoreCollection> {
  final fireStore = FirebaseFirestore.instance.collection('product');
  final nameController = TextEditingController();
  final imgController = TextEditingController();

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
                const Text("name : "),
                Container(
                  //height: 100,
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "name"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 52.0, top: 8.0, bottom: 8.0),
            child: Row(
              children: [
                const Text("ImageURL : "),
                Container(
                  //height: 100,
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    controller: imgController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "imageURL:"),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                fireStore
                    .doc()
                    .set({
                      "productID": id,
                      "productname": nameController.text.toString(),
                      "productImage": imgController.text.toString(),
                    })
                    .then((value) {})
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
              },
              child: const Text("Submit")),
        ],
      ),
    );
  }
}
