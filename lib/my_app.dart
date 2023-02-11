import 'package:flutter/material.dart';
import 'package:whats_app_numbers/languages/whats_app_numbers_strings.dart';
import 'package:whats_app_numbers/screens/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: WhatsAppNumbersStrings.myApp.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
