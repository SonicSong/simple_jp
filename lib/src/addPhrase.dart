import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

import '../main.dart';
import 'database.dart';

class AddPhrase extends StatefulWidget {
  const AddPhrase({super.key});

  @override
  State<AddPhrase> createState() => _AddPhraseState();
}

class _AddPhraseState extends State<AddPhrase> {
  final TextEditingController plController = TextEditingController();
  final TextEditingController jpController = TextEditingController();
  final TextEditingController romajiController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  String selectedCategory = list_EN.first;

  Future<void> _savePhrase() async {
    // await addQuestion(
    //   selectedCategory,
    //   plController.text,
    //   jpController.text,
    //   romajiController.text,
    //   noteController.text,
    // );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Phrase added successfully!")),
    );
    plController.clear();
    jpController.clear();
    romajiController.clear();
    noteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownMenu<String>(
            initialSelection: selectedCategory,
            onSelected: (value) {
              if (value != null) {
                setState(() => selectedCategory = value);
              }
            },
            dropdownMenuEntries: List.generate(
              list_EN.length,
                  (index) => DropdownMenuEntry<String>(
                value: list_EN[index],
                label: list_PL[index],
              ),
            ),
          ),
          TextField(
            controller: plController,
            decoration: InputDecoration(labelText: "Polish Text"),
          ),
          TextField(
            controller: jpController,
            decoration: InputDecoration(labelText: "Japanese Text"),
          ),
          TextField(
            controller: romajiController,
            decoration: InputDecoration(labelText: "Romaji"),
          ),
          TextField(
            controller: noteController,
            decoration: InputDecoration(labelText: "Notes"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _savePhrase,
            child: Text("Save Phrase"),
          ),
        ],
      ),
    );
  }
}
