import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modavibe/Data/sharedpreferences/shared_preferences.dart';
import 'package:modavibe/Model/login_model/login_model.dart';
import 'package:modavibe/Model/signup_model/signup_model.dart';

class Authrespository {
  static const String _baseurl = "https://cityvibe.jasim.online";
  static const String _signupendpoint = "/signup";
  static const String _loginenpoint = '/login';
//function to handle user signup
  Future<String> signup(Signupmodel signuprequest) async {
    try {
      final url = Uri.parse("$_baseurl$_signupendpoint");
      final body = jsonEncode(signuprequest.tojson());
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "accept": "applicaton/json"
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final token = data['data']['token'];
        final id = data['data']['users']['id'];
        savetoken(token);
        saveuserid(id);
        return "success";
      } else {
        final data = jsonDecode(response.body);
        String errormessage = '';
        if (data['error'] == "user alredy exist,sign in") {
          errormessage = data['error'];
        } else {
          errormessage = data['message'];
        }
        return errormessage;
      }
    } catch (e) {
      print('error during signup :$e');
      throw Exception("error in signup :$e");
    }
  }

// function to handel userlogin
  Future<String> login(Loginmodel loginrequest) async {
    try {
      final url = Uri.parse("$_baseurl$_loginenpoint");
      final body = jsonEncode(loginrequest.tojson());
      final response = await http.post(url,
          headers: {
            'Content-Type': "application/json",
            'accept': 'application/jdon'
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final token = data['data']['token'];
        final id = data['data']['users']['id'];
        savetoken(token);
        saveuserid(id);
        return 'success';
      } else {
        final data = jsonDecode(response.body);
        String errormessage = '';
        if (data['error'] == "user already exist,sign in") {
          errormessage == data['error'];
        } else {
          errormessage = data['message'];
        }
        return errormessage;
      }
    } catch (e) {
      print('error during login:$e');
      throw Exception('login failed:$e');
    }
  }
}
