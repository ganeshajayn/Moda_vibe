class Signupmodel {
  final String username;
  final String email;
  final String password;
  final String phone;
  final String confirmpasssword;
  Signupmodel(
      {required this.username,
      required this.email,
      required this.password,
      required this.phone,
      required this.confirmpasssword});
  Map<String, String> tojson() {
    return {
      "confirm password": confirmpasssword,
      "email": email,
      "phone": phone,
      "password": password,
      "username": username
    };
  }
}
