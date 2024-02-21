// Annonce_page_widget.dart
import 'package:arosaje/menu/DrawerMenu_widget.dart';
import 'package:flutter/material.dart';

class AnnoncePageWidget extends StatelessWidget {
  const AnnoncePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 20.0),
          ),
        ),
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
            SizedBox(height: 8), // Adjusted the height
            GradientButton(
              text: 'Créer une Annonce',
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
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
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return AnnonceCard(
          title: 'Plante1',
          content: 'Description',
          desc: "Taille 10cm",
          imagePath: index == 0 ? 'assets/plantes-accueil.jpg' : 'assets/plantes-accueil.jpg',
        );
      },
    );
  }
}

class AnnonceCard extends StatefulWidget {
  final String title;
  final String content;
  final String desc;
  final String imagePath;

  const AnnonceCard({
    Key? key,
    required this.title,
    required this.content,
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                widget.imagePath,
                height: 70.0, // Increase the height as needed
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 0.0), // Increase the vertical spacing
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
            SizedBox(height: 0.0),
            Text(widget.content),
            Text(widget.desc),
          ],
        ),
      ),
    );
  }
}
