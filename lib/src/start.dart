import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'database.dart';
import 'buttonBox.dart';

class Start extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: phraseButtonGet()
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
  List<Phrase>? _phrases;

  @override
  void initState() {
    super.initState();
    _fetchQuestionsDB();
  }

  Future<void> _fetchQuestionsDB() async {
    final mapping = await SqlDbCreate().getQuestions();

    if (mapping.isNotEmpty) {
      setState(() {
        _phrases = mapping.map(Phrase.fromMap).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
          child: _phrases == null
              ? CircularProgressIndicator()
              : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _phrases!.length,
            itemBuilder: (ctx, idx) {
              final p = _phrases![idx];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ButtonBox(phrase: p),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p.plText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(p.jpText, style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                          Text(p.romaji, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                          // Text(p.notes, style: TextStyle(fontSize: 16)),
                          Divider(thickness: 2.0,),
                        ],
                      ),
                    )
                  )
                ],
              );
              },
          ),
        ),
      ),
    );
  }
}