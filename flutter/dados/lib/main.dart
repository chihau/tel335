import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int numeroDado = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image(
              //  image: AssetImage('images/dice_1.png'),
              //)
              Padding(
                padding: EdgeInsets.all(50),
                child: Image.asset('images/dice_$numeroDado.png'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    numeroDado = Random().nextInt(6) + 1;
                    print(numeroDado);
                  });
                },
                child: Text(
                  'Lanzar',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
