import 'package:dio/dio.dart';
import 'package:modavibe/Model/product_model/productmodel.dart';

class Productservice {
  final Dio dio = Dio();
  Future<List<Productfromapi>> getproducts() async {
    try {
      final dio = Dio();
      final response = await dio
          .get("https://cityvibe.jasim.online/User/products/view products");
      if (response.statusCode == 200) {
        final responsedata = response.data as Map<String, dynamic>;
        if (responsedata["error"] == null) {
          final productlist = responsedata['data'] as List<dynamic>;
          return productlist
              .map((productdata) => Productfromapi.fromjson(productdata))
              .toList();
        } else {
          throw Exception("Api error :${responsedata['error']}");
        }
      } else {
        throw Exception(
            'Api request failed with statuscode :${response.statusCode}');
      }
    } on DioException catch (error) {
      throw Exception("error fetching products : ${error.message}");
    } catch (e) {
      throw Exception('Unexpected error :$e');
    }
  }
}
