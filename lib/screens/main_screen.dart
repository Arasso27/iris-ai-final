import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iris_ai/providers/iris_provider.dart';
import 'package:iris_ai/widgets/iris_avatar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final irisProvider = Provider.of<IrisProvider>(context);
    final isListening = irisProvider.isListening;
    final isSpeaking = irisProvider.isSpeaking;
    final userInput = irisProvider.userInput;
    final irisResponse = irisProvider.irisResponse;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Project Iris A.I',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 20),
          const IrisAvatar(),
          const SizedBox(height: 30),
          _buildChatBubble('You', userInput, isUser: true),
          const SizedBox(height: 10),
          _buildChatBubble('Iris', irisResponse, isUser: false),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: isListening || isSpeaking
                ? null
                : () {
                    irisProvider.listenAndRespond();
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text(
              'Mula Bercakap',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String sender, String message, {bool isUser = false}) {
    if (message.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 280),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isUser ? Colors.blueAccent : Colors.grey[800],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
