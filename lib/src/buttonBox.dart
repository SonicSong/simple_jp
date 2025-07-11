import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'database.dart';
import 'translation.dart';

class ButtonBox extends StatefulWidget {
  final Phrase phrase;

  const ButtonBox({Key? key, required this.phrase}) : super(key: key);

  @override
  State<ButtonBox> createState() => _ButtonBoxState();
}



class _ButtonBoxState extends State<ButtonBox> {
  final TranslationClass _translator = TranslationClass();
  String _currentInput = '';
  String _outputOfTranslation = '';

  @override
  void initState() {
    super.initState();
    _translator.ensureModelDownloaded();
  }

  @override
  void dispose() {
    _translator.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit(String? submitted) async {
    final text = submitted?.isNotEmpty == true ? submitted! : _currentInput;
    final translated = await _translator.translateText(text);
    if (!mounted) return;
    setState(() => _outputOfTranslation = translated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.phrase.plText)),
      body: SafeArea(
        child:SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.phrase.jpText, style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text(widget.phrase.romaji, style: TextStyle(fontSize: 20)),
              SizedBox(height: 16),
              Text(widget.phrase.notes, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
              SizedBox(height: 16,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ここに答えを入力してください'
                ),
                onChanged: (text) => _currentInput = text,
                onSubmitted: (text) => _handleSubmit(_currentInput),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _handleSubmit(null),
                child: const Text('Przetłumacz'),
              ),
              SizedBox(height: 12),
              Text(_outputOfTranslation)
            ],
          ),
        ),
      ),
    );
  }
}
