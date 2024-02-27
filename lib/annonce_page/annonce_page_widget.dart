// Annonce_page_widget.dart
import 'package:arosaje/garde_page/garde_page_model.dart';
import 'package:arosaje/garde_page/garde_page_widget.dart';
import 'package:arosaje/menu/DrawerMenu_widget.dart';
import 'package:flutter/material.dart';

class AnnoncePageWidget extends StatelessWidget {
  const AnnoncePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: DrawerMenuWidget(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Annonces',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: AnnonceCardList(),
            ),

          
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 53, 176, 104), Color.fromARGB(255, 17, 156, 112)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            
          ),
          
        ),
        
      ),
      
    );
    
  }
}

class AnnonceCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Nombre d'éléments par ligne
        crossAxisSpacing: 8.0, // Espacement horizontal entre les éléments
        mainAxisSpacing: 8.0, // Espacement vertical entre les éléments
      ),
      itemCount: 5, // Modifier la valeur à 4 pour inclure 2 annonces supplémentaires
      itemBuilder: (BuildContext context, int index) {
        return AnnonceCard(
          title: 'Plante${index + 1}', // Utilisation de l'index pour rendre les titres uniques
          ville: 'Camphin',
          nombre: 'nombre plantes 12',
          desc: "description",
          imagePath: 'assets/plantes-accueil.jpg',
        );
      },
    );
  }
}


class AnnonceCard extends StatefulWidget {
  final String title;
  final String ville;
  final String nombre;
  final String desc;
  final String imagePath;

  const AnnonceCard({
    Key? key,
    required this.title,
    required this.ville,
    required this.nombre,
    required this.desc,
    required this.imagePath,
  }) : super(key: key);

  @override
  _AnnonceCardState createState() => _AnnonceCardState();
}

class _AnnonceCardState extends State<AnnonceCard> {
  bool isLiked = false;

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Ici, vous pouvez appeler Navigator.push pour naviguer vers GardePageWidget
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GardePageWidget(
                      garde: GardePageModel(
                        title: widget.title,
                        ville: widget.ville,
                        nombre: widget.nombre,
                        desc: widget.desc,
                        imagePath: widget.imagePath,
                      ),
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  widget.imagePath,
                  width: double.infinity,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Color.fromARGB(255, 12, 94, 41),
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.ville),
                Text(widget.nombre),
                Text(widget.desc),
              ],
            ),
          ],
        ),
      ),
    );
  }
}