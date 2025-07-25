import 'package:flutter/material.dart';

class IrisProvider extends ChangeNotifier {
  bool _isListening = false;
  bool _isSpeaking = false;
  String _response = "";

  bool get isListening => _isListening;
  bool get isSpeaking => _isSpeaking;
  String get response => _response;

  void startListening() {
    _isListening = true;
    notifyListeners();
  }

  void stopListening() {
    _isListening = false;
    notifyListeners();
  }

  void startSpeaking() {
    _isSpeaking = true;
    notifyListeners();
  }

  void stopSpeaking() {
    _isSpeaking = false;
    notifyListeners();
  }

  void updateResponse(String text) {
    _response = text;
    notifyListeners();
  }

  void resetResponse() {
    _response = "";
    notifyListeners();
  }
}
