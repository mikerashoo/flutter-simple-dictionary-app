import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dictionary_app/models/word.dart';
import 'package:flutter_simple_dictionary_app/screens/word_detail_screen.dart';

class WordListCard extends StatelessWidget {
  const WordListCard({Key? key, required this.words}) : super(key: key);

  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: words.map((i) {
        return Card(
          child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WordDetailScreen(
                            wordId: i.id!,
                          )),
                );
              },
              trailing: i.isFavorite!
                  ? const Icon(
                      Icons.star,
                      color: Colors.orange,
                    )
                  : null,
              title: Text(i.kafinoonoo!),
              subtitle: i.type != "null" ? Text(i.type!) : null),
        );
      }).toList(),
    );
  }
}
