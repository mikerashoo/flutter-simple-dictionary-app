import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dictionary_app/models/word.dart';
import 'package:flutter_simple_dictionary_app/repositories/dictionary_repository.dart';

class AppProvider extends ChangeNotifier {
  List<Word> words = [];
  List<Word> currentWords = [];
  List<Word> favoriteWords = [];
  late Word? currentWord = Word();
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

  void getWordDetail(id) async {
    Word word = await dictionaryRepository.fetchWord(id);
    currentWord = word;
    notifyListeners();
  }

  void fetchFavorites() async {
    var _favorites = await dictionaryRepository.favorites();
    favoriteWords = _favorites;
    notifyListeners();
  }

  void toggleFavorite(Word word, value) async {
    await dictionaryRepository.toggleFavorite(word.id!, value);
    currentWord!.isFavorite = !currentWord!.isFavorite!;
    notifyListeners();
    fetchFavorites();
    fetchWords();
  }

  void searchWords(String search) async {
    currentWords = [];
    for (var word in words) {
      if (word.kafinoonoo!.toLowerCase().startsWith(search.toLowerCase())) {
        currentWords.add(word);
      }
    }
    notifyListeners();
  }
}
