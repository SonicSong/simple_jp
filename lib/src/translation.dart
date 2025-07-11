import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'database.dart';

Future<String> Translate(text) async {
  final TranslateLanguage sourceLanguage;
  final TranslateLanguage targetLanguage;

  final onDeviceTranslator = OnDeviceTranslator(sourceLanguage: TranslateLanguage.japanese, targetLanguage: TranslateLanguage.polish);

  final String response = await onDeviceTranslator.translateText(text);

  return response;
}