import 'package:flutter/material.dart';
import 'package:life_sync_ph2/dashboard.dart';
import 'package:life_sync_ph2/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Sync',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        // ignore: deprecated_member_use
        backgroundColor: Pallete.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.backgroundColor,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
