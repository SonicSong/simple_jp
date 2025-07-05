import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text 1'),
            Text('Text 2'),
            Text('Text 3'),
          ],
        ),
      ),
    );
  }
}