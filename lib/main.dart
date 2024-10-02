import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/model/consts.dart';
import 'common/model/word.dart';
import 'main.mapper.g.dart';

void main() async {
  initializeJsonMapper();
  runApp(MyApp());
}

Future<List<Word>> fetchWords() async {
  final List<Word> words = [];
  for (var i = 1; i <= 4; i++) {
    String jsonString =
        await rootBundle.loadString(Consts.getWordsWithIndex(i));
    final newWords = JsonMapper.deserialize<List<Word>>(jsonString) ?? [];
    words.addAll(newWords);
  }
  return words;
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterTts flutterTts = FlutterTts();

  bool isSpeaking = false;

  Future<void> configureTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setVolume(1.0);
  }

  void speakText(String text) async {
    await configureTts();
    await flutterTts.speak(text);
  }

  void stopSpeaking() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Word journey'),
        ),
        body: Center(
          child: FutureBuilder(
              future: fetchWords(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final words = snapshot.data as List<Word>;
                  return ListView.builder(
                    itemCount: words.length,
                    itemBuilder: (context, index) {
                      final word = words[index];
                      return ListTile(
                        leading: IconButton(
                          icon: const Icon(Icons.volume_up),
                          onPressed: () {
                            speakText(word.text);
                          },
                        ),
                        title: Text(word.text),
                        subtitle: Text(word.meanings.join(', ')),
                        trailing: RichText(
                          text: TextSpan(
                            text: word.pronunciation,
                            style: GoogleFonts.notoSerif(
                              textStyle: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
