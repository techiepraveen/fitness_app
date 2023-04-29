import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/provider/BMIprovider.dart';
import 'package:fitness_app/screens/homepage.dart';
import 'package:fitness_app/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//complete code
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BmiProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            color: Colors.green,
            home: SplashScreen(),
            // routes: {
            //   '/homepage': (_) => const HomePage(),
            // },
          );
        },
      ),
    );
    // return MaterialApp(
    //   color: Colors.green,
    //   home: const SplashScreen(),
    //   routes: {
    //     '/homepage': (_) =>const HomePage(),
    //   },
    // );
  }
}
