import 'dart:developer';

import 'package:flutter/material.dart';

import 'database.dart';
import 'buttonBox.dart';
import '../main.dart';

String selectedCategoryOfQuestions = "All";

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu<String>(
                  initialSelection: list_EN_cat.first,
                  onSelected: (String? value) {
                    _PhraseButtonGet()._fetchQuestionDBOnCategory(value!);
                  },
                  dropdownMenuEntries:
                  List.generate(
                      list_EN_cat.length,
                          (index) => DropdownMenuEntry<String>(
                          value: list_EN_cat[index],
                          label: list_PL_cat[index]
                      )),
                )
              ]
          ),
        ),
        Expanded(
            child: phraseButtonGet()
        )
      ],
    );
  }
}

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

  Future<void> _fetchQuestionDBOnCategory(String category) async {
    final mapping_cat = await SqlDbCreate().getQuestionsByCategory(category!);

    log(mapping_cat.first as String);
    if (mapping_cat.isNotEmpty) {
      setState(() {
        _phrases = mapping_cat.map(Phrase.fromMap).toList();
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
