import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: MainApp(),
    ),
  );
}

List<String>? _saved = [];

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<String> _suggested = [];

  _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('saved', _saved!);
  }

  _loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _saved = prefs.getStringList('saved');

    if (_saved == null) {
      _saved = [];
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Namer'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int i) {
          print("i = $i");

          _suggested.add(generateWordPairs().take(2).first.asPascalCase);
          bool alreadySaved = _saved!.contains(_suggested[i]);

          if (i.isOdd) {
            return Divider();
          } else {
            return ListTile(
              title: Text(
                _suggested[i],
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
              ),
              onTap: () {
                setState(() {
                  if (alreadySaved == true) {
                    _saved!.remove(_suggested[i]);
                  } else {
                    _saved!.add(_suggested[i]);
                  }
                });

                _saveData();
              },
            );
          }
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Namer - Saved'),
      ),
      body: ListView.builder(
        itemCount: _saved!.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(_saved![i]),
          );
        },
      ),
    );
  }
}
