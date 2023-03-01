import 'dart:convert';

List<ChatMessage> chatMessageFromJson(String str) => List<ChatMessage>.from(json.decode(str).map((x) => ChatMessage.fromJson(x)));

String chatMessageToJson(List<ChatMessage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatMessage {
    ChatMessage({
        required this.role,
        required this.content,
    });

    String role;
    String content;

    factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        role: json["role"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
    };
}
