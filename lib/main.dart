import 'package:flutter/material.dart';

import 'package:flutter_book_app/views/screen/onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kitap Uygulaması',
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
