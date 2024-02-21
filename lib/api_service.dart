import 'package:http/http.dart' as http;

class ApiService {
static Future<void> fetchData() async {
  try {
    var response = await http.get(Uri.parse('http://localhost:8888/mspr/back/api.php'));

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
