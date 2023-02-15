import 'package:chatgpt_integration/models/chat_model.dart';
import 'package:chatgpt_integration/services/api_service.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList => chatList;

  void addUserMessage({required String message}) {
    chatList.add(
      ChatModel(
        msg: message,
        chatIndex: 0,
      ),
    );
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers({
    required String message,
    required String modelId,
  }) async {
    chatList.addAll(
      await ApiService.sendMessage(
        message: message,
        modelId: modelId,
      ),
    );
    notifyListeners();
  }
}
