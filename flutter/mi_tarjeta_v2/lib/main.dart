import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    fontFamily: 'Caveat',
                  ),
                ),
                Text(
                  'Ingeniero de Software',
                  style: GoogleFonts.orbitron(
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
                      launchUrl(Uri.parse('tel:+56 9 99999999'));
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
                    onTap: () {
                      launchUrl(Uri.parse('mailto:chihau.chau@usm.cl'));
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
                    onTap: () {
                      launchUrl(Uri.parse('https://x.com/chihau'));
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
                    onTap: () {
                      launchUrl(Uri.parse(
                          'https://www.google.com/maps/place/Av.+Espa%C3%B1a+1680,+2580816+Valpara%C3%ADso/@-33.0343587,-71.5972368,968m/data=!3m2!1e3!4b1!4m6!3m5!1s0x9689e0b59627236d:0x86499de0392a795!8m2!3d-33.0343587!4d-71.5946619!16s%2Fg%2F11qb517158?entry=ttu&g_ep=EgoyMDI1MDMzMC4wIKXMDSoASAFQAw%3D%3D'));
                    },
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
