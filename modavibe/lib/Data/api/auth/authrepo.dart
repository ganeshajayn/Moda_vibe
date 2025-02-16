import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modavibe/Data/sharedpreferences/shared_preferences.dart';
import 'package:modavibe/Model/login_model/login_model.dart';
import 'package:modavibe/Model/signup_model/signup_model.dart';

class Authrespository {
  static const String _baseurl = "https://cityvibe.jasim.online";
  static const String _signupendpoint = "/signup";
  static const String _loginenpoint = "/login";
//function to handle user signup
  Future<String> signup(Signupmodel signuprequest) async {
    try {
      final url = Uri.parse("$_baseurl$_signupendpoint");
      //  print("url :$url");
      final body = jsonEncode(signuprequest.tojson());
      //  print("request body :$body");
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "accept": "application/json"
          },
          body: body);
      //    print('response:$response');
      //   print("responsebody:${response.body}");
      print("request sent:$url");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return "OK";
      } else {
        final data = jsonDecode(response.body);
        final errormessage = data['message'] ?? "Unknown error";
        print("error response ;${response.body}");
        return errormessage;
      }
    } catch (e) {
      //  print('error during signup :$e');
      throw Exception("error in signup :$e");
    }
  }

// function to handel userlogin
  Future<String> login(Loginmodel loginrequest) async {
    print("login function started");
    try {
      // final url = Uri.parse("$_baseurl$_loginenpoint");
      print("request iniated");
      final body = jsonEncode(loginrequest.tojson());
      final url = Uri.parse("https://cityvibe.jasim.online/login");
      final response = await http.post(url,
          headers: {
            'Content-Type': "application/json",
            'accept': 'application/json'
          },
          body: body);
      print("request send");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        //      print('response body :$body');
        final token = data['token'];
        final id = data['user']['ID'];
        savetoken(token);
        saveuserid(id);
        print("reqst succeed");
        return 'OK';
      } else {
        print("reqst failed");
        final data = jsonDecode(response.body);
        final errormessgae = data['message'] ?? "unknownerror";
        //   print('errormessage:${response.body}');
        return errormessgae;
      }
    } catch (e) {
      // print('error during login:$e');
      throw Exception('login failed:$e');
    }
  }
}
