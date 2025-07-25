import 'package:flutter/material.dart';
import 'package:iris_ai/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'modules/iris_provider.dart';

void main() {
  runApp(const IrisApp());
}

class IrisApp extends StatelessWidget {
  const IrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IrisProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Iris A.I',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
