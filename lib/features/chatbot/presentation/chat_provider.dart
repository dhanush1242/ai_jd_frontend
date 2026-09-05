import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/chat_repository.dart';
import 'chatbot_panel.dart'; // To reuse ChatMessage

part 'chat_provider.g.dart';

@riverpod
class Chat extends _$Chat {
  @override
  List<ChatMessage> build() {
    return [
      ChatMessage(
        text: 'Hello! How can I help you today?',
        isBot: true,
      ),
    ];
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    
    // Add user message
    state = [
      ...state,
      ChatMessage(text: text, isBot: false),
    ];
    
    try {
      final repository = ref.read(chatRepositoryProvider);
      final responseText = await repository.sendMessage(text);
      
      // Add bot response
      state = [
        ...state,
        ChatMessage(text: responseText, isBot: true),
      ];
    } catch (e) {
      // Add error message from bot
      state = [
        ...state,
        ChatMessage(text: 'Sorry, I encountered an error: ${e.toString()}', isBot: true),
      ];
    }
  }
}
