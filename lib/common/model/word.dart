import 'package:json_annotation/json_annotation.dart';
import 'package:word_journey/common/model/topic.dart';
import 'package:word_journey/common/model/word_type.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  String text;
  List<String> meanings;
  List<WordType> wordTypes;
  List<Topic> topics;
  String pronunciation;
  List<String> examples;

  Word({
    required this.text,
    required this.meanings,
    required this.wordTypes,
    required this.topics,
    required this.pronunciation,
    this.examples = const [],
  });

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);

  @override
  String toString() {
    return 'Word{text: $text, meanings: $meanings, wordTypes: $wordTypes, topics: $topics, pronunciation: $pronunciation, examples: $examples}';
  }
}
