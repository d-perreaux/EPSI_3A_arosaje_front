import 'package:http/http.dart' as http;

class ApiService {
static Future<void> fetchData() async {
  try {
    var response = await http.get(Uri.parse('http://localhost:8888/EPSI_3A_arosaje_back/api.php'));
   // var response = await http.get(Uri.parse('https://arosajeapi-pe4kgyna5q-od.a.run.app/api.php')); 


    if (response.statusCode == 200) {
      // Traitement des données de l'API
      print('Réponse de l\'API : ${response.body}');
    } else {
      // Gérer les erreurs HTTP
      print('Erreur de requête : ${response.statusCode}');
    }
  } catch (error) {
    // Gérer les erreurs génériques
    print('Erreur lors de la requête : $error');
  }
}
}
