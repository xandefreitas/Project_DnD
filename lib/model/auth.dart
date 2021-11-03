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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idToken'] = this.idToken;
    data['email'] = this.email;
    data['refreshToken'] = this.refreshToken;
    data['expiresIn'] = this.expiresIn;
    data['localId'] = this.localId;
    data['registered'] = this.registered;
    return data;
  }
}
