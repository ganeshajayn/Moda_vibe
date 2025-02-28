import 'dart:convert';

import 'package:modavibe/Model/category_model/categorymodel.dart';
import 'package:http/http.dart' as http;

class Categoryrepository {
  Future<List<CategoryModel>> fetchcategorybyId(int id) async {
    final url = Uri.parse("https://cityvibe.jasim.online/admin/category");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => CategoryModel.fromjson(json)).toList();
      } else {
        throw Exception(
            "failed to load categpries,Statuscode:${response.statusCode}");
      }
    } catch (e) {
      print("error fetching categories:$e");
    }
    throw Exception("unexpected error :No response from the api");
  }
}
