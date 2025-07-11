import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'database.dart';

class TranslationClass {
  Future<String> Translate(text) async {
    final TranslateLanguage sourceLanguage;
    final TranslateLanguage targetLanguage;

    final onDeviceTranslator = OnDeviceTranslator(sourceLanguage: TranslateLanguage.japanese, targetLanguage: TranslateLanguage.polish);

    final String response = await onDeviceTranslator.translateText(text);

    return response;
  }

  Future<void> modelCheck() async {
    final modelManager = OnDeviceTranslatorModelManager();
    final bool response1 = await modelManager.isModelDownloaded(TranslateLanguage.polish.bcpCode);
    final bool response2 = await modelManager.isModelDownloaded(TranslateLanguage.japanese.bcpCode);

    print('Response one PL ${response1}');
    print('Response two JP ${response2}');

    if (response1 == false && response2 == false) {
      final bool responseDlPL = await modelManager.downloadModel(TranslateLanguage.polish.bcpCode);
      final bool responseDlJP = await modelManager.downloadModel(TranslateLanguage.japanese.bcpCode);

      print('Response download PL ${responseDlPL}');
      print('Response download JP ${responseDlJP}');
    }
  }
}