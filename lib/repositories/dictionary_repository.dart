import 'package:flutter_simple_dictionary_app/models/word.dart';
import 'package:sqflite/sqflite.dart';

class DictionaryRepository {
  final Database db;
  DictionaryRepository({required this.db});
  String table = "words";
  Future<List<Word>> words() async {
    final maps = await db.query(table);
    List<Word> words = [];
    for (var row in maps) {
      words.add(wordFromMap(row));
    }
    return words;
  }

  Future<List<Word>> favorites() async {
    final maps =
        await db.query('words', where: 'is_favorite = ?', whereArgs: [1]);
    List<Word> words = [];
    for (var row in maps) {
      words.add(wordFromMap(row));
    }
    return words;
  }

  Future<dynamic> fetchWord(id) async {
    final maps =
        await db.query(table, where: 'id = ? LIMIT 1', whereArgs: [id]);
    Word word = wordFromMap(maps.first);
    return word;
  }

  Future<dynamic> toggleFavorite(int wordId, value) async {
    int _value = value ? 1 : 0;
    Map<String, int> updateValue = Map();
    updateValue["is_favorite"] = _value;
    return await db
        .update(table, updateValue, where: 'id = ?', whereArgs: [wordId]);
  }

  Word wordFromMap(row) {
    var kafinoonoo = row["kafinoonoo"];
    var amharic = row["amharic"];
    var english = row["english"];
    var type = row["type"];
    var id = row["id"];
    var isFavorite = row["is_favorite"];
    Word word = Word(
        id: int.parse(id.toString()),
        kafinoonoo: kafinoonoo.toString(),
        amharic: amharic.toString(),
        english: english.toString(),
        type: type.toString(),
        isFavorite: isFavorite == 1);
    return word;
  }
}
