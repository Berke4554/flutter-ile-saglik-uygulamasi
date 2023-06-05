import 'package:flutter/material.dart';
import 'package:umay_deneme/welcome_sayfasi.dart';

void main() {
  runApp(UmayApp());
}

class UmayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: WelcomeSayfasi(),
    );
  }
}
