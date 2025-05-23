import 'package:flutter/material.dart';
import 'package:newshive/views/introduction_screen.dart';
import 'package:newshive/views/utils/helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          title: 'NewsHive',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: cPrimary),
            useMaterial3: true
          ),
          home: IntroductionScreen()
    );
  }
}