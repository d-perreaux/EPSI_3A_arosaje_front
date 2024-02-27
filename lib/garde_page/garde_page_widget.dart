// garde_page_widget.dart
import 'package:arosaje/garde_page/garde_page_model.dart';
import 'package:arosaje/menu/DrawerMenu_widget.dart';
import 'package:flutter/material.dart';

class GardePageWidget extends StatelessWidget {
  final GardePageModel? garde;

  const GardePageWidget({Key? key, this.garde}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image en haut avec les informations
          
            SizedBox(height: 16),
            // Informations (title, desc, nombre) et image de plante regroupées dans un Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image de photo1
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/photo1.jpg',
                    width: 100.0, // Ajustez la largeur selon vos préférences
                    height: 100.0, // Ajustez la hauteur selon vos préférences
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16), // Espacement entre l'image et les informations
                // Informations (title, desc, nombre) dans une colonne
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      garde?.title ?? 'Titre non disponible',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(garde?.desc ?? 'Description non disponible'),
                    SizedBox(height: 8),
                    Text(garde?.nombre ?? 'Nombre non disponible'),
                  ],
                ),
              ],
            ),
            // Bouton "Souscrire à la garde"
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Souscrire à la garde'),
                      content: Text('Ajoutez ici la logique de souscription.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
               style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
              child: Text('Souscrire à la garde'),
            ),  
               SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 200.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  garde?.imagePath ?? 'Chemin de l\'image non disponible',
                  width: 100.0, // Ajustez la largeur selon vos préférences
                  height: 100.0, // Ajustez la hauteur selon vos préférences
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          
        ),
        
      ),
      
    );
  }
}
