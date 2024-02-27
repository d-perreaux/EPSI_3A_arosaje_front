// ConnexionPageWidget.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:arosaje/home_page/home_page_widget.dart';
import 'package:arosaje/register_page/register_page_widget.dart';
import 'package:http/http.dart' as http;

class ConnexionPageWidget extends StatefulWidget {
  const ConnexionPageWidget({Key? key}) : super(key: key);

  @override
  _ConnexionPageWidgetState createState() => _ConnexionPageWidgetState();
}

class _ConnexionPageWidgetState extends State<ConnexionPageWidget> {
  final TextEditingController _emailAdressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: Container(),
          title: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, right: 20.0),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 54, 150, 100), Color.fromARGB(255, 43, 68, 60)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Connexion',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailAdressController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 52, 52, 52)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: true,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      var response = await http.post(
                        Uri.parse('http://localhost:8888/EPSI_3A_arosaje_back/api.php/connexion'),
                        body: {
                          'email': _emailAdressController.text,
                          'mdp': _passwordController.text,
                        },
                      );
                      print(_emailAdressController.text);
                      print(_passwordController.text);


                      if (response.statusCode == 200) {
                        final Map<String, dynamic> data = json.decode(response.body);

                        if (data['ut_id'] != 'refused') {
                          setState(() {
                            isLoggedIn = true;
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageWidget(),
                            ),
                          );
                        } else {
                          print("erreur");
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Erreur'),
                              content: Text('Nom d\'utilisateur ou mot de passe incorrect'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      } else {
                        print('Erreur de requête : ${response.statusCode}');
                      }
                    } catch (error) {
                      print('Erreur lors de la requête : $error');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Color.fromARGB(255, 58, 58, 58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(isLoggedIn ? 'Se déconnecter' : 'Envoyer'),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPageWidget(),
                      ),
                    );
                  },
                  child: Text(
                    "Créer un compte",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
