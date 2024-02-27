// creergarde_widget.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreerGardeWidget extends StatefulWidget {
  @override
  _CreerGardeWidgetState createState() => _CreerGardeWidgetState();
}

class _CreerGardeWidgetState extends State<CreerGardeWidget> {
  final _formKey = GlobalKey<FormState>();
  final _adresseController = TextEditingController();
  final _proprioController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une garde'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Adresse de la garde
              TextFormField(
                controller: _adresseController,
                decoration: InputDecoration(labelText: 'Adresse de la garde'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'adresse de la garde';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Nom de la plante
              TextFormField(
                controller: _proprioController,
                decoration: InputDecoration(labelText: 'Nom du propriétaire'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le du propriétaire';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Image Picker
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.camera),
                              title: Text('Prendre une photo'),
                              onTap: () {
                                _getImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.photo),
                              title: Text('Choisir depuis la galerie'),
                              onTap: () {
                                _getImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: Icon(Icons.photo_camera, color: Colors.white),
                      ),
              ),

              SizedBox(height: 16),

              // Bouton de validation
            ElevatedButton(
  onPressed: () async {
    if (_formKey.currentState?.validate() ?? false) {
      try {

        var response = await http.post(
          Uri.parse('http://localhost:8888/EPSI_3A_arosaje_back/api.php/createGarde'),
          body: {
            'adresse': _adresseController.text,
            'proprio': _proprioController.text,
            'description': _descriptionController.text,
          },
        );

        if (response.statusCode == 200) {
          print('Réponse du serveur : ${response.body}');
          final Map<String, dynamic> data = json.decode(response.body.trim());
          print('Réponse data : ${data}');
          // Traitez les données de la réponse comme nécessaire
          if (data.containsKey('ga_id')) {

            // Faites quelque chose ici, peut-être redirigez vers une nouvelle page
          } else {
            // Gestion des erreurs, par exemple, affichez un message à l'utilisateur
          }
        } else {
          print('Erreur de requête : ${response.statusCode}');
          // Gestion des erreurs, par exemple, affichez un message à l'utilisateur
        }
      } catch (error) {
        print('Erreur lors de la requête : $error');
        // Gestion des erreurs, par exemple, affichez un message à l'utilisateur
      }
    }
  },
  child: Text('Créer la garde'),
),
            ],
          ),
        ),
      ),
    );
  }
}
