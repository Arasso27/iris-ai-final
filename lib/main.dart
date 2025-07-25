import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/iris_provider.dart';
import 'screens/home.dart';

void main() {
  runApp(const IrisAIApp());
}

class IrisAIApp extends StatelessWidget {
  const IrisAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IrisProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Project Iris A.I',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const HomePage(),
      ),
    );
  }
}
