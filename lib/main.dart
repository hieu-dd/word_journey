import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';

import 'common/model/topic.dart';
import 'common/model/word.dart';
import 'common/model/word_type.dart';
import 'main.mapper.g.dart';

void main() {
  initializeJsonMapper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final thanksword = Word(
      text: 'Thanks',
      meanings: ['an expression of gratitude'],
      wordTypes: [WordType.noun],
      topics: [Topic.communication],
      pronunciation: 'θæŋks',
      examples: ['Thanks for your help.'],
    );

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
          child: Text(JsonMapper.serialize(thanksword)),
        ),
      ),
    );
  }
}
