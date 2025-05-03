import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Lottiefiles extends StatefulWidget {
  const Lottiefiles({super.key});

  @override
  State<Lottiefiles> createState() => _LottiefilesState();
}

class _LottiefilesState extends State<Lottiefiles>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Lottie.network(
                  "https://lottie.host/c859bc0e-9aa0-4b9b-942a-7e67a26454c5/dqhJ9Yj7NS.json")
              //"https://lottie.host/f490903a-f8e5-4ddc-878d-4addafe8576f/kO5rMIZd7S.json"
              //"https://lottie.host/6fcb31bb-1194-4254-aed6-32eabe713a38/IojP1y6TFp.json"),
              //         Lottie.asset('assets/images/bag.json',
              //             width: 300,
              //             height: 300,
              //             fit: BoxFit.fill,
              //             frameRate: FrameRate(30),
              //             controller: _controller)),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     IconButton(
              //         onPressed: () {
              //           _controller.forward();
              //         },
              //         icon: Icon(
              //           Icons.play_circle,
              //           size: 50,
              //         )),
              //     IconButton(
              //         onPressed: () {
              //           _controller.stop();
              //         },
              //         icon: Icon(
              //           Icons.pause_circle_filled,
              //           size: 50,
              //         ))
              //   ],
              )
        ],
      ),
    );
  }
}
