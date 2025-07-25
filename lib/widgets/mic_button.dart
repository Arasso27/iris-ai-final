import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/iris_provider.dart';

class MicButton extends StatelessWidget {
  const MicButton({super.key});

  @override
  Widget build(BuildContext context) {
    final iris = Provider.of<IrisProvider>(context);

    return IconButton(
      iconSize: 64,
      icon: Icon(
        iris.isListening ? Icons.mic : Icons.mic_none,
        color: iris.isOnline ? Colors.red : Colors.grey,
      ),
      onPressed: iris.isOnline
          ? () {
              iris.toggleListening();
            }
          : null,
    );
  }
}
