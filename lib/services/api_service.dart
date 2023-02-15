import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_integration/constants/api_constants.dart';
import 'package:chatgpt_integration/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://api.openai.com/v1/models',
        ),
        headers: {
          'Authorization': 'Bearer $apiKey',
        },
      );

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        // print('jsonResponse["error"] ${jsonResponse["error"]["message"]}');
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
}
