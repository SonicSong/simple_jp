import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import 'kana_convert.dart';

class TranslationClass {
  late final OnDeviceTranslator _translator;

  TranslationClass() {
    _translator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.japanese,
      targetLanguage: TranslateLanguage.polish,
    );
  }

  Future<void> ensureModelDownloaded() async {
    final modelManager = OnDeviceTranslatorModelManager();
    if (!await modelManager.isModelDownloaded(TranslateLanguage.polish.bcpCode)) {
      await modelManager.downloadModel(TranslateLanguage.polish.bcpCode);
    }
    if (!await modelManager.isModelDownloaded(TranslateLanguage.japanese.bcpCode)) {
      await modelManager.downloadModel(TranslateLanguage.japanese.bcpCode);
    }
  }

  Future<String> translateText(String input) async {
    final kanaText = await KanaConvert().isItKana(input);
    final result = await _translator.translateText(kanaText);
    return result;
  }

  void dispose() {
    _translator.close();
  }
}
