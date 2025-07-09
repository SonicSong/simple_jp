import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'database.dart';

class Start extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return phraseButtonGet();
              },
            )
        )
      ],
    );
  }
}

//constructor for "buttons" that would contain the phrases from QuestionsDB.db
class phraseButtonGet extends StatefulWidget {
  const phraseButtonGet({super.key});

  @override
  State<phraseButtonGet> createState() => _PhraseButtonGet();
}

class _PhraseButtonGet extends State<phraseButtonGet> {
  Map<String, dynamic>? _phrases;

  @override
  void initState() {
    super.initState();
    _fetchQuestionsDB();
  }

  Future<void> _fetchQuestionsDB() async {
    final phrases = await SqlDbCreate().getQuestions();
    setState(() {
      _phrases = phrases.isNotEmpty ? phrases.first : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _phrases == null ? CircularProgressIndicator() : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _phrases!['pl_text'] ?? 'No phrase found',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )
                ),
                Text(
                  "${_phrases!['notes'] ?? 'No notes found'}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18)
                ),
              ],
            )
        )
      )
    );
  }
}