import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Lottiefiles extends StatefulWidget {
  const Lottiefiles({super.key});

  @override
  State<Lottiefiles> createState() => _LottiefilesState();
}

class _LottiefilesState extends State<Lottiefiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://lottie.host/6875a8d2-52b8-4e9e-a613-8cdea9297435/hwXhHVgDkl.json"
            //"https://lottie.host/f490903a-f8e5-4ddc-878d-4addafe8576f/kO5rMIZd7S.json"
            //"https://lottie.host/6fcb31bb-1194-4254-aed6-32eabe713a38/IojP1y6TFp.json"
            ),
      ),
    );
  }
}
