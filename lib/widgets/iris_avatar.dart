import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/iris_provider.dart';

class IrisAvatar extends StatelessWidget {
  const IrisAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final iris = Provider.of<IrisProvider>(context);

    return CircleAvatar(
      radius: 80,
      backgroundColor: iris.isOnline ? Colors.blueAccent : Colors.grey,
      child: Icon(
        iris.isListening ? Icons.hearing : Icons.person,
        color: Colors.white,
        size: 60,
      ),
    );
  }
}
