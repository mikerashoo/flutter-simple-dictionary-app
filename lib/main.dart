import 'package:flutter/material.dart';
import 'package:flutter_simple_dictionary_app/providers/app_provider.dart';
import 'package:flutter_simple_dictionary_app/screens/home_page.dart';
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
          home: const HomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
