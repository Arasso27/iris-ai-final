import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/iris_provider.dart';
import '../widgets/mic_button.dart';
import '../widgets/iris_avatar.dart';
import '../widgets/status_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final iris = Provider.of<IrisProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const StatusBar(),
            const Expanded(
              child: Center(
                child: IrisAvatar(),
              ),
            ),
            const MicButton(),
            const SizedBox(height: 24),
            Text(
              iris.response,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
