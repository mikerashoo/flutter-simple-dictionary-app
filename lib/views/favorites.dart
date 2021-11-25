import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dictionary_app/providers/app_provider.dart';
import 'package:flutter_simple_dictionary_app/screens/word_detail_screen.dart';
import 'package:flutter_simple_dictionary_app/views/word_list_card.dart';
import 'package:provider/provider.dart';

class FavoriteWords extends StatefulWidget {
  const FavoriteWords({Key? key}) : super(key: key);

  @override
  _FavoriteWordsState createState() => _FavoriteWordsState();
}

class _FavoriteWordsState extends State<FavoriteWords> {
  final myController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: appProvider.currentWords.isEmpty
              ? const Center(
                  child: Text(
                  "No word found",
                  style: TextStyle(color: Colors.orange),
                ))
              : WordListCard(
                  words: appProvider.favoriteWords,
                ),
        )
      ],
    );
  }
}
