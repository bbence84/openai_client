import 'package:http/http.dart' as http;
import 'package:openai_client/src/client.dart';
import 'package:openai_client/src/logger/logger.dart';
import 'package:openai_client/src/model/model.dart';
import 'package:openai_client/src/network/network.dart';
import 'dart:convert';

/// Creates a completion for the provided prompt and parameters.
///
/// For more detail see the [OpenAI API documentation](https://platform.openai.com/docs/api-reference/chat).
class OpenAIChatCompletions {
  /// Creates a new instance which belongs to [client].
  OpenAIChatCompletions(this.client)
      : baseUrl = client.baseUrl.resolve(apiChatCompletions);

  /// The parent [OpenAIClient].
  final OpenAIClient client;

  /// The base url for all endpoints for [ChatCompletions].
  ///
  /// See more at [ChatCompletions](https://beta.openai.com/docs/api-reference/completions).
  final Uri baseUrl;

  /// Creates a completion for the provided prompt and parameters.
  ///
  /// A deeper explanation of the parameters can be
  /// found in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/completions/create).
  Request<ChatCompletion> create({
    required String model,
    List<Map<String, dynamic>>? messages,
    int maxTokens = 16,
    double temperature = 1.0,
    double topP = 1.0,
    int n = 1,
    bool stream = false,
    bool echo = false,
    String? stop,
    double presencePenalty = 0.0,
    double frequencyPenalty = 0.0,
    Map<String, dynamic>? logitBias,
    String? user,
  }) {
    Logger(
      title: 'ChatCompletions',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    );

    final jsonBody = <String, dynamic>{
      'model': model,
      'messages': messages,
      'max_tokens': maxTokens,
      'temperature': temperature,
      'top_p': topP,
      'n': n,
      'stream': stream,
      'echo': echo,
      'stop': stop,
      'presence_penalty': presencePenalty,
      'frequency_penalty': frequencyPenalty,
      if (logitBias != null) 'logit_bias': logitBias,
      if (user != null) 'user': user,
    };

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', baseUrl),
      bodyDeserializer: (body) =>
          ChatCompletion.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'ChatCompletions',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    );

    return req;
  }
}


