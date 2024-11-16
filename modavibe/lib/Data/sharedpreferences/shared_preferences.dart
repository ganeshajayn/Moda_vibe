import 'package:shared_preferences/shared_preferences.dart';

Future<String?> gettoken() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access token') ?? '';
  } catch (e) {
    print("error fetching token :$e");
    throw Exception('failed to get access token :$e');
  }
}

Future<int?> getuserid() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Userid') ?? 0;
  } catch (e) {
    print("error fetching token:$e");
    throw Exception('failed to get the token:$e');
  }
}

// function to save the access token
Future<void> savetoken(String token) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access token', token);
  } catch (e) {
    print('Error saving id:$e');
    throw Exception("failed to save the id :$e");
  }
}

Future<void> saveuserid(int id) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Userid', id);
  } catch (e) {
    throw Exception("error to fetch id :$e");
  }
}
