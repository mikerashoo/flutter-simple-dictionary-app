import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dictionary_app/models/word.dart';
import 'package:flutter_simple_dictionary_app/repositories/dictionary_repository.dart';

class AppProvider extends ChangeNotifier {
  List<Word> words = [];
  List<Word> currentWords = [];
  late DictionaryRepository dictionaryRepository;

  void setDictionaryRepository(DictionaryRepository _dictionaryRepository) {
    dictionaryRepository = _dictionaryRepository;
  }

  void fetchWords() async {
    var _words = await dictionaryRepository.words();
    currentWords = _words;
    words = _words;
    notifyListeners();
  }

  void searchWords(String search) async {
    currentWords = [];
    for (var word in words) {
      if (word.kafinoonoo.toLowerCase().startsWith(search.toLowerCase())) {
        currentWords.add(word);
      }
    }
    notifyListeners();
  }
}
