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
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage('images/chihau.png'),
                  radius: 50,
                ),
                Text(
                  'Chihau Chau',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ingeniero de Software',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
                    title: Text(
                      '+56 9 99999999',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      print('llamando...');
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    title: Text(
                      'chihau.chau@usm.cl',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.share,
                      color: Colors.red,
                    ),
                    title: Text(
                      '@chihau',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.directions,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Av España 1680, Valparaíso',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
