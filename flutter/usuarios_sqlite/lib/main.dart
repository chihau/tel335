import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MainApp());
}

Future openMyDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'my_database.db');
  print(path);

  Database database = await openDatabase(
    path,
    version: 2,
    onCreate: (db, version) {
      print('onCreate');

      db.execute("CREATE TABLE Usuarios (id INTEGER, nombre TEXT)");

      for (int i = 1; i <= 5; i++) {
        int id = i;
        String nombre = "Usuario $i";

        db.execute(
            "INSERT INTO Usuarios (id, nombre) VALUES ('$id','$nombre')");
      }
    },
    onUpgrade: (db, oldVersion, newVersion) {
      print('onUpgrade');
      db.execute("DROP TABLE IF EXISTS Usuarios");
      db.execute("CREATE TABLE Usuarios (id INTEGER, nombre TEXT)");

      for (int i = 1; i <= 5; i++) {
        int id = i;
        String nombre = "Usuario $i";

        db.execute(
            "INSERT INTO Usuarios (id, nombre) VALUES ('$id','$nombre')");
      }
    },
  );

  return database;
}

Future selectUsers() async {
  Database db = await openMyDatabase();
  var list = await db.rawQuery("SELECT * FROM Usuarios");
  //print(list);
  return list;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Usuarios SQLite'),
        ),
        body: FutureBuilder(
          future: selectUsers(),
          builder: (context, snapshot) {
            //return Text(snapshot.data.toString());

            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                      snapshot.data[index]['nombre'],
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }),
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
