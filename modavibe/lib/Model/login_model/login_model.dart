class Loginmodel {
  final String email;
  final String password;
  Loginmodel({required this.email, required this.password});
  Map<String, dynamic> tojson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
