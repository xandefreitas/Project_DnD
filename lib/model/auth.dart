class Auth {
  String idToken;
  String email;
  String refreshToken;
  String expiresIn;
  String localId;
  bool registered;
  Auth({
    this.email,
    this.expiresIn,
    this.idToken,
    this.localId,
    this.refreshToken,
    this.registered,
  });
  Auth.fromJson(Map<String, dynamic> json) {
    idToken = json['idToken'];
    email = json['email'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
    localId = json['localId'];
    registered = json['registered'];
  }
}
