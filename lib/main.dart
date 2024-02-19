import 'package:arosaje/annonce_page/annonce_page_model.dart';
import 'package:flutter/material.dart';
import 'home_page/home_page_widget.dart';
import 'annonce_page/annonce_page_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arosaje',
      theme: ThemeData(
        // Définir le thème de votre application ici
        // ...
      ),
      initialRoute: '/',  // Définir la route initiale
      routes: {
        '/': (context) => const HomePageWidget(),  // Page d'accueil
        '/annonce': (context) => const AnnoncePageWidget(),  // Page d'annonce
      },
    );
  }
}
