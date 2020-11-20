import 'package:flutter/material.dart';
import './pages/home.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
