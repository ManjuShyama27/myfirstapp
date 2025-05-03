import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';
import 'package:translator/translator.dart';

class MyTranslator extends StatefulWidget {
  const MyTranslator({super.key});

  @override
  State<MyTranslator> createState() => _MyTranslatorState();
}

class _MyTranslatorState extends State<MyTranslator> {
  String API_KEY = "YOUR_GEMINI_API_KEY";

  dynamic response;
  void translate(String fromLang, String toLang, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation =
        await translator.translate(input, from: fromLang, to: toLang);
    setState(() {
      output = translation.text.toString();
    });
  }

  void translatewithgemini(String fromLang, String toLang, String input) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: API_KEY,
    );
    final content = [
      Content.text("Translate ${input} from ${fromLang} to ${toLang}")
    ];
    response = await model.generateContent(content);

    setState(() {
      output = response.text.toString();
    });
  }

  var languages = [
    "English",
    "German",
    "Spanish",
    "French",
    "Chinese",
    "Japanese",
    "Italian",
    "Arabic",
    "Korean",
    "Russian",
    "Marathi",
    "Hindi",
    "Tamil",
    "Telugu",
    "Malayalam",
    "Urdu",
    "Punjabi",
    "Gujarati"
  ];
  var originLan = "English";
  var destLan = "French";
  var output = "";
  String getLangCode(String code) {
    if (code == "English") {
      return 'en';
    } else if (code == "Hindi") {
      return 'hi';
    } else if (code == "Marathi") {
      return 'mr';
    } else if (code == "Spanish") {
      return 'es';
    } else if (code == "French") {
      return 'fr';
    } else if (code == "German") {
      return 'de';
    } else if (code == "Japanese") {
      return 'ja';
    } else if (code == "Chinese") {
      return 'zh';
    } else if (code == "Tamil") {
      return 'ta';
    } else if (code == "Telugu") {
      return 'te';
    } else if (code == "Malayalam") {
      return 'ml';
    } else if (code == "Urdu") {
      return 'ur';
    } else if (code == "Korean") {
      return 'ko';
    } else if (code == "Russian") {
      return 'ru';
    } else if (code == "Punjabi") {
      return 'pa';
    } else if (code == "Gujarati") {
      return 'gu';
    } else if (code == "Italian") {
      return 'it';
    } else if (code == "Arabic") {
      return 'ar';
    }
    return "en";
  }

  TextEditingController source = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LANGUAGE TRANSLATOR',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.network(
              'https://lottie.host/f4af7a40-7ad7-46a2-b951-953a581a6bcc/6lVwT6HtPj.json'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                dropdownColor: Colors.brown[100],
                focusColor: Colors.brown[100],
                value: originLan,
                onChanged: (newValue) {
                  setState(() {
                    originLan = newValue!;
                  });
                },
                items: languages.map((lang) {
                  return DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
              ),
              Icon(Icons.arrow_right_alt),
              DropdownButton(
                dropdownColor: Colors.brown[100],
                focusColor: Colors.brown[100],
                value: destLan,
                onChanged: (newValue) {
                  setState(() {
                    destLan = newValue!;
                  });
                },
                items: languages.map((lang) {
                  return DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: source,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.all(16),
                  hintText: "Enter Text to be translated",
                  fillColor: Colors.deepOrange[100]),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (source.text.isEmpty) {
                  print('Enter text to be translated');
                } else {
                  // translate(getLangCode(originLan), getLangCode(destLan),
                  //     source.text);
                  translatewithgemini(originLan, destLan, source.text);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.translate_rounded),
                  Text(' TRANSLATE'),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: 150,
              child: Text(
                output,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
