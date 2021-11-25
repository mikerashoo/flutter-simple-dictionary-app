import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dictionary_app/models/word.dart';
import 'package:flutter_simple_dictionary_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class WordDetailScreen extends StatefulWidget {
  const WordDetailScreen({Key? key, required this.wordId}) : super(key: key);

  final int wordId;
  @override
  _WordDetailScreenState createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // Word word = widget.word;
    AppProvider appProvider = Provider.of<AppProvider>(context);
    appProvider.getWordDetail(widget.wordId);
    Word word = appProvider.currentWord!;
    return word.id == null
        ? const SizedBox()
        : Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(word.kafinoonoo!),
            ),
            body: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          word.kafinoonoo!,
                          style: const TextStyle(fontSize: 30),
                        ),
                        word.type == "null"
                            ? const SizedBox()
                            : Text(word.type!),
                        IconButton(
                            onPressed: () {
                              appProvider.toggleFavorite(
                                  word, !word.isFavorite!);
                            },
                            icon: word.isFavorite!
                                ? const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  )
                                : const Icon(Icons.star_border))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text("አማረኛ : "),
                        Text(word.amharic!),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text("English : "),
                        Text(word.english!),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
