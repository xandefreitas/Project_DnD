abstract class Consts {
  static const String BaseUrl = String.fromEnvironment('base_url', defaultValue: "https://www.dnd5eapi.co/api/");
  static const String BaseUrlDB = String.fromEnvironment('database_url', defaultValue: 'https://project-dnd-88432-default-rtdb.firebaseio.com/');
  static const String BaseUrlAuth = String.fromEnvironment('database_url_auth', defaultValue: 'https://identitytoolkit.googleapis.com/v1/accounts:');
  static const String BaseAPIKey = String.fromEnvironment('database_url_key', defaultValue: 'AIzaSyCWHyID0erO6Lgy-lYjCQifYNgohgJFNqs');
}
