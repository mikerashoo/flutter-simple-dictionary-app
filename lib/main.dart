import 'package:flutter/material.dart';
import 'package:flutter_simple_dictionary_app/providers/app_provider.dart';
import 'package:flutter_simple_dictionary_app/repositories/db_helper.dart';
import 'package:flutter_simple_dictionary_app/repositories/dictionary_repository.dart';
import 'package:flutter_simple_dictionary_app/word_detail_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  // dbHelper.initDb();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

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
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
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
                    child: const Text(
                    "No word found",
                    style: TextStyle(color: Colors.orange),
                  ))
                : ListView(
                    padding: const EdgeInsets.all(8.0),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: appProvider.currentWords.map((i) {
                      return Card(
                        child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WordDetailScreen(
                                          word: i,
                                        )),
                              );
                            },
                            title: Text(i.kafinoonoo),
                            subtitle: i.type != "null" ? Text(i.type) : null),
                      );
                    }).toList(),
                  ),
          )
        ],
      ),
    );
  }
}
