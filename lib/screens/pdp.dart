import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final text;

  const ProductDetails({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(text),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.red,
                child: Text(text),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.white,
                  child: Text(text)),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Add"),
              ),
            ],
          ),
        ));
  }
}

// class ProductDetails extends StatefulWidget {
//   final text;

//   const ProductDetails({super.key, required this.text});

//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.text),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 color: Colors.red,
//                 child: Text(widget.text),
//               ),
//               Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   color: Colors.white,
//                   child: Text(widget.text)),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: const Text("Add"),
//               ),
//             ],
//           ),
//         ));
//   }
// }
