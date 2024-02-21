import 'package:arosaje/api_service.dart';
import 'package:arosaje/connexion_page/connexion_page_widget.dart';
import 'package:arosaje/register_page/register_page_widget.dart';
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
      initialRoute: '/connexion',
      home: FutureBuilder(
        future: ApiService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePageWidget();
          } else {
            // Peut-être afficher un indicateur de chargement ici
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      routes: {
        '/annonce': (context) => const AnnoncePageWidget(),
        '/connexion': (context) => const ConnexionPageWidget(),
        '/register': (context) => RegisterPageWidget(),
      },
    );
  }
}
