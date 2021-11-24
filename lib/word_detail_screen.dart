import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dictionary_app/models/word.dart';

class WordDetailScreen extends StatefulWidget {
  WordDetailScreen({Key? key, required this.word}) : super(key: key);

  Word word;
  @override
  _WordDetailScreenState createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Word word = widget.word;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.word.kafinoonoo),
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
                    widget.word.kafinoonoo,
                    style: const TextStyle(fontSize: 30),
                  ),
                  word.type == "null" ? SizedBox() : Text(word.type)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("አማረኛ : "),
                  Text(word.amharic),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("English : "),
                  Text(word.english),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
