import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myfirstapp/Affirmly.dart';

class MyNotification extends StatefulWidget {
  String message;
  MyNotification(this.message, {super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todays affirmation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: const Color.fromARGB(255, 248, 214, 227),
            child: Column(
              children: [
                widget.message.contains("growth") ||
                        widget.message.contains("focus") ||
                        widget.message.contains("confidence")
                    ? Lottie.network(
                        "https://lottie.host/c5fd1efe-310b-438e-9587-4d620a03ede3/2iFX86z7Fv.json")
                    : widget.message.contains("mindfullness") ||
                            widget.message.contains("gratitude") ||
                            widget.message.contains("love")
                        ? Lottie.network(
                            "https://lottie.host/1306b3bd-f647-4e49-b145-55712d73bc7f/3ndQuNLbuD.json")
                        : Lottie.network(
                            "https://lottie.host/9edfb1cc-3ca4-40ff-af5b-528c2ad78c1a/hixQ8TbSsT.json"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.message.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
