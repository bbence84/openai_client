import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:openai_client/src/model/shared_models/shared_models.dart';

/// The completion class.
class ChatCompletion extends Equatable {
  /// Instance of [ChatCompletion].
  const ChatCompletion({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChatCompletion].
  factory ChatCompletion.fromJson(String data) {
    return ChatCompletion.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Mappping from [Map] to [ChatCompletion].
  factory ChatCompletion.fromMap(Map<String, dynamic> data) => ChatCompletion(
        id: data['id'] as String,
        object: data['object'] as String,
        created: data['created'] as int,
        model: data['model'] as String,
        choices: (data['choices'] as List<dynamic>)
            .map((e) => ChatChoice.fromMap(e as Map<String, dynamic>))
            .toList(),
        usage: Usage.fromMap(data['usage'] as Map<String, dynamic>),
      );

  /// The completion id.
  final String id;

  /// The completion object.
  final String object;

  /// The completion created.
  final int created;

  /// The completion model.
  final String model;

  /// The completion choices.
  final List<ChatChoice> choices;

  /// The completion usage.
  final Usage usage;

  /// Mappping from [ChatCompletion] to [Map].
  Map<String, dynamic> toMap() => {
        'id': id,
        'object': object,
        'created': created,
        'model': model,
        'choices': choices.map((e) => e.toMap()).toList(),
        'usage': usage.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [ChatCompletion] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  ChatCompletion copyWith({
    String? id,
    String? object,
    int? created,
    String? model,
    List<ChatChoice>? choices,
    Usage? usage,
  }) {
    return ChatCompletion(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      model: model ?? this.model,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, object, created, model, choices, usage];
}
