// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      text: json['text'] as String,
      meanings:
          (json['meanings'] as List<dynamic>).map((e) => e as String).toList(),
      wordTypes: (json['wordTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$WordTypeEnumMap, e))
          .toList(),
      topics: (json['topics'] as List<dynamic>)
          .map((e) => $enumDecode(_$TopicEnumMap, e))
          .toList(),
      pronunciation: json['pronunciation'] as String,
      examples: (json['examples'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'text': instance.text,
      'meanings': instance.meanings,
      'wordTypes':
          instance.wordTypes.map((e) => _$WordTypeEnumMap[e]!).toList(),
      'topics': instance.topics.map((e) => _$TopicEnumMap[e]!).toList(),
      'pronunciation': instance.pronunciation,
      'examples': instance.examples,
    };

const _$WordTypeEnumMap = {
  WordType.adjective: 'adjective',
  WordType.adverb: 'adverb',
  WordType.noun: 'noun',
  WordType.verb: 'verb',
  WordType.pronoun: 'pronoun',
  WordType.preposition: 'preposition',
  WordType.conjunction: 'conjunction',
  WordType.interjection: 'interjection',
};

const _$TopicEnumMap = {
  Topic.travel: 'travel',
  Topic.shopping: 'shopping',
  Topic.communication: 'communication',
  Topic.education: 'education',
  Topic.technology: 'technology',
  Topic.health: 'health',
  Topic.food: 'food',
  Topic.culture: 'culture',
};
