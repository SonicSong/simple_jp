import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'database.dart';

class ButtonBox extends StatelessWidget {
  final Phrase phrase;

  const ButtonBox({Key? key, required this.phrase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(phrase.plText)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(phrase.plText, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text(phrase.jpText, style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            SizedBox(height: 12),
            Text(phrase.romaji, style: TextStyle(fontSize: 18, color: Colors.grey[700])),
            SizedBox(height: 16),
            Text(phrase.notes, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16,),
            Text('HERE GOES THE TRANSLATION', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
