import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dictionary_app/providers/app_provider.dart';
import 'package:flutter_simple_dictionary_app/screens/word_detail_screen.dart';
import 'package:flutter_simple_dictionary_app/views/word_list_card.dart';
import 'package:provider/provider.dart';

class AllWords extends StatefulWidget {
  const AllWords({Key? key}) : super(key: key);

  @override
  _AllWordsState createState() => _AllWordsState();
}

class _AllWordsState extends State<AllWords> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: TextField(
            controller: myController,
            onChanged: (value) {
              appProvider.searchWords(value);
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        Flexible(
          child: appProvider.currentWords.isEmpty
              ? const Center(
                  child: Text(
                  "No word found",
                  style: TextStyle(color: Colors.orange),
                ))
              : WordListCard(
                  words: appProvider.currentWords,
                ),
        )
      ],
    );
  }
}
