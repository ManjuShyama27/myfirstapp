import 'dart:convert';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';
import 'package:myfirstapp/local_notifications.dart';
import 'package:myfirstapp/notifiaction.dart';

class Affirmly extends StatefulWidget {
  const Affirmly({super.key});

  @override
  State<Affirmly> createState() => _AffirmlyState();
}

class _AffirmlyState extends State<Affirmly> {
  ScheduledTask? scheduledTask;
  String apiKey = "AIzaSyCsbYA-HcMLJCxoOF49QccvXUx6o8eXMJk";

  dynamic response;
  String myaffirmation = "";
  final cron = Cron();

  void scheduleAffirmation() async {
    scheduledTask = cron.schedule(Schedule.parse("*/30 * * * * *"), () async {
      generateAffirmations();
    });
  }

  void cancelScheduledAffrirmation() {
    scheduledTask!.cancel();
  }

  void generateAffirmations() async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
    final content = [
      Content.text(
          ''' You are an imaginative assistant who crafts a **new, surprising, motivational, and inspiring affirmation every day.**

Each time you run, follow these rules:

1. **Randomly choose** an area of life — for example:  
   love, gratitude, mindfulness, confidence, letting go, growth mindset, purpose, forgiveness, abundance, focus, rest, kindness, present moment, or trusting the journey.

2. **Randomly choose** a style — such as:  
   quote, tweet, tiny story, metaphor, joke, letter, song lyric, or a strange fact with hidden wisdom.


 Use your full imagination.  
 Avoid repetition of area and style.  
 Keep it simple, original, and easy to connect with.

Limit the message to **2–3 short lines**,use emojis and and make it **feel-good**.

Now, generate today’s one-of-a-kind affirmation.In the message specify only the area,style and message


''')
    ];
    response = await model.generateContent(content);

    setState(() {
      myaffirmation = response.text.toString();
    });
    LocalNotifications.showNotifications(
        title: "Todays Affirmation :)",
        body: myaffirmation,
        payload: myaffirmation);
  }

  @override
  void initState() {
    listenToNotification();
    super.initState();
  }

  listenToNotification() {
    LocalNotifications.onClickNotification.stream.listen((event) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MyNotification(event)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Affirmly",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.network(
              "https://lottie.host/1306b3bd-f647-4e49-b145-55712d73bc7f/3ndQuNLbuD.json"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                    iconColor: WidgetStateProperty.all(Colors.white),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    backgroundColor: WidgetStateProperty.all(Colors.pink[200])),
                onPressed: () {
                  //generateAffirmations();
                  scheduleAffirmation();
                },
                label: Text('Show Daily Affirmations '),
                icon: Icon(Icons.notifications_active),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                    iconColor: WidgetStateProperty.all(Colors.white),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    backgroundColor: WidgetStateProperty.all(Colors.pink[200])),
                onPressed: () {
                  cancelScheduledAffrirmation();
                },
                label: Text('Cancel Daily Affirmations '),
                icon: Icon(Icons.cancel_presentation),
              ),
            ],
          )
        ],
      ),
    );
  }
}
