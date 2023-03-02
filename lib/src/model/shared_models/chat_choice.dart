import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The choice class.
class ChatChoice extends Equatable {
  /// Instance of [ChatChoice].
  const ChatChoice({
    required this.message,
    required this.index,
    this.finishReason,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChatChoice].
  factory ChatChoice.fromJson(String data) {
    return ChatChoice.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Mappping from [Map] to [ChatChoice].
  factory ChatChoice.fromMap(Map<String, dynamic> data) => ChatChoice(
        message: data['message'] as Map<String, dynamic>,
        index: data['index'] as int,
        finishReason: data['finish_reason'] as String?,
      );

  /// The choice message.
  final Map<String, dynamic> message;

  /// The choice index.
  final int index;

  /// The choice finish reason.
  final String? finishReason;

  /// Mappping from [ChatChoice] to [Map].
  Map<String, dynamic> toMap() => {
        'message': message,
        'index': index,
        'finish_reason': finishReason,
      };

  /// `dart:convert`
  ///
  /// Converts [ChatChoice] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  ChatChoice copyWith({
    Map<String, dynamic>? message,
    int? index,
    String? finishReason,
  }) {
    return ChatChoice(
      message: message ?? this.message,
      index: index ?? this.index,
      finishReason: finishReason ?? this.finishReason,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, index, finishReason];
}
