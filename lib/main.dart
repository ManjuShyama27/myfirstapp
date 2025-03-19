import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/Buttons.dart';
import 'package:myfirstapp/FormFile.dart';
import 'package:myfirstapp/GeminiFile.dart';
import 'package:myfirstapp/LottieFiles.dart';
import 'package:myfirstapp/MyCheckBox.dart';
import 'package:myfirstapp/MyTabBar.dart';
import 'package:myfirstapp/RadioButtons.dart';

void main() {
  runApp(const MyApp());
}

var myTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: myColor,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ),
    iconTheme: IconThemeData(color: myColor));

Color myColor = Colors.red;

var firstTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: myColor,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.openSans(
        fontSize: 27,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.roboto(),
      displaySmall: GoogleFonts.abel(),
    ),
    iconTheme: IconThemeData(color: myColor));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: firstTheme,
      home: Lottiefiles(),
      initialRoute: '/',
      routes: {
        '/first': (context) => Buttons(),
        '/second': (context) => Radiobuttons(),
        '/third': (context) => MyTabBar(),
        '/fourth': (context) => MyCheckBox()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawer: Drawer(
      //     key: scaffoldKey,
      //     child: ListView(
      //         // Important: Remove any padding from the ListView.
      //         padding: EdgeInsets.zero,
      //         children: [
      //           DrawerHeader(
      //             decoration: BoxDecoration(
      //                 gradient:
      //                     LinearGradient(colors: [Colors.pink, Colors.teal])),
      //             child: Row(
      //               children: [
      //                 Align(
      //                   alignment: Alignment.centerLeft,
      //                   child: Text(
      //                     'End Drawer',
      //                     style: TextStyle(fontSize: 30, color: Colors.white),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           ListTile(
      //             title: const Text('Tile 1'),
      //             onTap: () {
      //               Navigator.pushNamed(context, '/first');
      //             },
      //           ),
      //           ListTile(
      //             title: const Text('Tile 2'),
      //             onTap: () {
      //               Navigator.pushNamed(context, '/first');
      //             },
      //           ),
      //         ])),
      drawer: Drawer(
        elevation: 2,
        shadowColor: Theme.of(context).secondaryHeaderColor,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.pink, Colors.teal])),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'FLUTTER WIDGETS',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Buttons'),
              onTap: () {
                Navigator.pushNamed(context, '/first');
              },
            ),
            ListTile(
              title: const Text('Radio Buttons'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Radiobuttons()),
                );
              },
            ),
            ListTile(
              title: const Text('Application Form'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormFileScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Checkbox'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/fourth');
              },
            ),
            ListTile(
              title: const Text('TabBar'),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/third', ModalRoute.withName('/')),
            ),
            ListTile(
              title: const Text('Contact Me'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormFileScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Gemini'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gemini()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: myColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 2,
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            color: myColor,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                              child: ColorPicker(
                            pickerColor: myColor,
                            onColorChanged: changeColor,
                          )));
                    });
              },
              child: Text('Pick Color'))
        ],
      )
          //     SingleChildScrollView(
          //   child: GridTile(
          //       child: Column(
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           print('Clicked on pikachu');
          //         },
          //         child: Theme(
          //           data: myTheme,
          //           child: Card(
          //             child: Center(
          //               child: Padding(
          //                 padding: EdgeInsets.all(5),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text('Pikachu'.toUpperCase(),
          //                         style: TextStyle(
          //                           fontFamily: 'Montserrat',
          //                           color: Colors.indigo,
          //                           fontSize: 18,
          //                           fontWeight: FontWeight.w800,
          //                         )),
          //                     Image.asset(
          //                       'assets/images/pikachu.jpeg',
          //                       fit: BoxFit.fill,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Card(
          //         child: Center(
          //           child: Padding(
          //             padding: EdgeInsets.all(5),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text('Squirtle'.toUpperCase(),
          //                     style: TextStyle(
          //                       color: Colors.indigo,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w800,
          //                     )),
          //                 Image.asset(
          //                   'assets/images/squirtle.jpeg',
          //                   fit: BoxFit.fill,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Card(
          //         color: Colors.grey,
          //         elevation: 7,
          //         child: Center(
          //           child: Padding(
          //             padding: EdgeInsets.all(5),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text('Raichu'.toUpperCase(),
          //                     style: TextStyle(
          //                       color: Colors.indigo,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w800,
          //                     )),
          //                 Image.asset(
          //                   'assets/images/raichu.png',
          //                   fit: BoxFit.fill,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   )),
          // )
          ),
    );
  }

  void changeColor(Color color) {
    setState(() => myColor = color);
  }
}
