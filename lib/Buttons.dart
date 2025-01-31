import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('My Buttons'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            child: Text('Elevated Button'),
          ),
          TextButton(
              onPressed: () {
                Tooltip(child: Text('Text Button Pressed'));
              },
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all<Color>(Colors.pinkAccent),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: Text('Text Button')),
          OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all<Color>(Colors.indigoAccent),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: Text('Outlined Button')),
          IconButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.orange),
              ),
              icon: Icon(Icons.add_alarm_outlined)),
          FloatingActionButton(
            onPressed: () {},
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
