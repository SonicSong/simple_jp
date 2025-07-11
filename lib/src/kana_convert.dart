import 'package:kana_kit/kana_kit.dart';

// What user inputs in "box" should be translated to kana and passed to translation and later displayed below "box". not efficient but better separation.

class KanaConvert {
  Future<String> isItKana(text) async {
    String Translated = '';
    const kanaKit = KanaKit();

    if (kanaKit.isKana(text) == false) {
      Translated = kanaKit.toKana(text);
    } else {
      Translated = text;
    }

    return Translated;
  }
}