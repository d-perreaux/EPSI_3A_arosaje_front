import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  final bool isLoggedIn;
DrawerMenuWidget({this.isLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2DC29A), Color(0xFF497C5D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 200.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Bouton "Se connecter"
               
                buildDrawerItem(Icons.home, 'Accueil', context),
                buildDrawerItem(Icons.hail, 'Annonces', context),
                // ... (other menu items)
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/photo1.jpg'),
                      radius: 50.0,
                    ),
                    SizedBox(height: 10.0),
                  
                  
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: const Color.fromARGB(158, 255, 255, 255)),
                          SizedBox(width: 15.0),
                          Text(
                            'Se déconnecter',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Implémentez votre logique de déconnexion
                        Navigator.pop(context);
                         Navigator.pushNamed(context, '/connexion');
                        // Exemple de déconnexion avec FirebaseAuth
                        // FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color.fromARGB(158, 255, 255, 255)),
          SizedBox(width: 15.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pop(context);
        if (title == 'Accueil') {
          Navigator.pushNamed(context, '/');
        } else if (title == 'Annonces') {
          Navigator.pushNamed(context, '/annonce');
        }
      },
    );
  }
}
