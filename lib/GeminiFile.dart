import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Gemini extends StatefulWidget {
  const Gemini({super.key});

  @override
  State<Gemini> createState() => _GeminiState();
}

class _GeminiState extends State<Gemini> {
  final TextEditingController prompt = TextEditingController();
  final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: "AIzaSyCsbYA-HcMLJCxoOF49QccvXUx6o8eXMJk",
      generationConfig: GenerationConfig());
  final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCsbYA-HcMLJCxoOF49QccvXUx6o8eXMJk');
  GenerateContentResponse? response;
  dynamic content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Gemini Integration"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 700,
              child: SingleChildScrollView(
                // child: response == null
                //     ? Center(
                //         child: CircularProgressIndicator(
                //           color: Colors.deepPurple,
                //         ),
                //       )
                child: Card(
                  child: Text(''),
                ),
              ),
            ),
            TextField(
              controller: prompt,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    content = [Content.text(prompt.text.toString())];

                    response = await model.generateContent(content);
                    print(response.toString());
                  },
                ),
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
                fillColor: Colors.grey,
                hintText: 'Enter prompt',
              ),
            )
          ],
        ),
      ),
    );
  }
}
