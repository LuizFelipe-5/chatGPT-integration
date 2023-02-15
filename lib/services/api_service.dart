import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_integration/constants/api_constants.dart';
import 'package:chatgpt_integration/models/chat_model.dart';
import 'package:chatgpt_integration/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse(
          '$baseUrl/models',
        ),
        headers: {
          'Authorization': 'Bearer $apiKey',
        },
      );

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        // log('temp ${value['id']}');
      }

      return ModelsModel.modelsFromSnapshot(temp);
    } catch (e) {
      log('err $e');
      rethrow;
    }
  }

  static Future<List<ChatModel>> sendMessage({
    required String message,
    required String modelId,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(
          '$baseUrl/completions',
        ),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': modelId,
          'prompt': message,
          'max_tokens': 100,
        }),
      );

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      List<ChatModel> chatList = [];

      if (jsonResponse['choices'].length > 0) {
        chatList = List.generate(
          jsonResponse['choices'].length,
          (index) => ChatModel(
            msg: jsonResponse['choices'][index]['text'],
            chatIndex: 1,
          ),
        );
      }
      return chatList;
    } catch (e) {
      log('err $e');
      rethrow;
    }
  }
}
