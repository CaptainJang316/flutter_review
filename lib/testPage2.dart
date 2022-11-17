import 'package:flutter/material.dart';

class TestPage2 extends StatelessWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page 2'),
      ),
      body: Center(child: Text("Test Page 2")),
    );
  }
}