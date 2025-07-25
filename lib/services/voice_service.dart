import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:iris_ai/providers/iris_provider.dart';
import 'package:provider/provider.dart';

class VoiceService {
  final FlutterTts _flutterTts = FlutterTts();
  final SpeechToText _speechToText = SpeechToText();

  Future<void> initTTS() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.45);
  }

  Future<void> speak(String text, context) async {
    final irisProvider = Provider.of<IrisProvider>(context, listen: false);
    irisProvider.startSpeaking();
    await _flutterTts.speak(text);
    _flutterTts.setCompletionHandler(() {
      irisProvider.stopSpeaking();
    });
  }

  Future<void> listen(context) async {
    final irisProvider = Provider.of<IrisProvider>(context, listen: false);
    bool available = await _speechToText.initialize();

    if (available) {
      irisProvider.startListening();

      _speechToText.listen(
        onResult: (result) async {
          irisProvider.stopListening();
          irisProvider.updateResponse("Thinking...");

          String userText = result.recognizedWords;

          // Simulasi respon AI, gantikan dengan real API jika perlu
          await Future.delayed(Duration(seconds: 1));
          String aiResponse = "You said: $userText";

          irisProvider.updateResponse(aiResponse);
          await speak(aiResponse, context);
        },
      );
    }
  }

  void stopListening() {
    _speechToText.stop();
  }
}
