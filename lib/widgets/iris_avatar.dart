import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iris_ai/providers/iris_provider.dart';

class IrisAvatar extends StatelessWidget {
  const IrisAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final irisProvider = Provider.of<IrisProvider>(context);
    bool isSpeaking = irisProvider.isSpeaking;
    bool isListening = irisProvider.isListening;

    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: isSpeaking || isListening ? 180 : 140,
        height: isSpeaking || isListening ? 180 : 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: isSpeaking
                ? [Colors.blueAccent, Colors.lightBlueAccent]
                : isListening
                    ? [Colors.greenAccent, Colors.tealAccent]
                    : [Colors.grey[400]!, Colors.grey[300]!],
          ),
          boxShadow: [
            BoxShadow(
              color: isSpeaking || isListening
                  ? Colors.blue.withOpacity(0.4)
                  : Colors.black12,
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            isSpeaking
                ? Icons.record_voice_over
                : isListening
                    ? Icons.hearing
                    : Icons.android,
            size: 64,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
