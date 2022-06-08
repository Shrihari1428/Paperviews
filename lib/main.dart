import 'package:flutter/material.dart';
import 'package:paperviews/Views/HomePage/home_page.dart';

void main() {
  runApp(const PaperView());
}

class PaperView extends StatelessWidget {
  const PaperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      title: 'Paperview',
      home: const Homepage(),
    );
  }
}

