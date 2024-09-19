import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_app/model/store_model.dart';

class ProductServices {
  Dio dio;
  ProductServices(this.dio);
  Future<ProductModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');
      ProductModel productModel = ProductModel.fromJson(response.data);
      return productModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
