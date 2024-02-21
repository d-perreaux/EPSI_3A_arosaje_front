class RegisterPageModel {

  checkIfEmailExists(String email) async {
    // Votre logique pour vérifier si l'e-mail existe déjà, sans utiliser Firebase
    // Remplacez cela par votre propre logique personnalisée si nécessaire
    // Vous pouvez par exemple utiliser votre API pour vérifier l'existence de l'e-mail
  }

  Future<void> createAccount(String email, String password, String username,
      Function(dynamic) errorCallback, Function() successCallback) async {
    try {
      print('Avant la création de l\'utilisateur');

      // Implémentez votre propre logique de création d'utilisateur ici
      // Vous pouvez utiliser votre propre API pour créer un utilisateur

      print('Après la création de l\'utilisateur');
      // Appelez la fonction de succès ici
      successCallback();
    } catch (e) {
      errorCallback(e);
    }
  }
}
