import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hola Images'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Image(
            //image: NetworkImage(
            //    'https://docs.flutter.dev/assets/images/dash/Dash.png'),
            image: AssetImage('images/Dash.png'),
          ),
        ),
      ),
    );
  }
}
