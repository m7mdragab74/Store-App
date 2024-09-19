import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:store_app/model/store_model.dart';

class ProductServices {
  Dio dio;
  ProductServices(this.dio);

  Future<List<Product>> getProducts() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');
      List<Product> products = (response.data as List)
          .map((product) => Product.fromJson(product))
          .toList();
      return products;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, there was an error, try later.';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, there was an error, try later.');
    }
  }
}
