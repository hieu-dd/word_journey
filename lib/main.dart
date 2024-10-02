import 'package:flutter/material.dart';

import 'common/model/topic.dart';
import 'common/model/word.dart';
import 'common/model/word_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          child: Text(Word(
            text: 'Flutter',
            meanings: ['to flap the wings without flying'],
            wordTypes: [WordType.verb],
            topics: [Topic.communication],
            pronunciation: 'ˈflʌtər',
            examples: ['The bird fluttered its wings.'],
          ).toString()),
        ),
      ),
    );
  }
}
