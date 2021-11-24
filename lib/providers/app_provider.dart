import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dictionary_app/models/word.dart';
import 'package:flutter_simple_dictionary_app/repositories/dictionary_repository.dart';
import 'package:sqflite/sqflite.dart';

class AppProvider extends ChangeNotifier {
  List<Word> words = [];
  late DictionaryRepository dictionaryRepository;

  void setDictionaryRepository(DictionaryRepository _dictionaryRepository) {
    dictionaryRepository = _dictionaryRepository;
  }

  void fetchWords() async {
    words = await dictionaryRepository.words();
    notifyListeners();
  }
}
