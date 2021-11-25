import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dictionary_app/providers/app_provider.dart';
import 'package:flutter_simple_dictionary_app/repositories/db_helper.dart';
import 'package:flutter_simple_dictionary_app/repositories/dictionary_repository.dart';
import 'package:flutter_simple_dictionary_app/views/all_words.dart';
import 'package:flutter_simple_dictionary_app/views/favorites.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    setDatabase();
  }

  void setDatabase() async {
    DictionaryRepository dictionaryRepository =
        DictionaryRepository(db: await DbHelper().initDb());
    AppProvider appProvider =
        // ignore: unnecessary_this
        Provider.of<AppProvider>(this.context, listen: false);
    appProvider.setDictionaryRepository(dictionaryRepository);
    appProvider.fetchWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the HomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: selectedIndex == 0 ? const AllWords() : const FavoriteWords(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
