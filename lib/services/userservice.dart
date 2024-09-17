import 'package:dio/dio.dart';
import 'package:store_app/model/usermodel.dart';
import 'package:store_app/services/Endpoints.dart';

class Userservice {
  static final String baseurl = "https://fakestoreapi.com";
  static final Dio dio = Dio();
  static Future<List<Usermodel>> getusers() async {
    Response response = await dio.get("$baseurl/${Endpoints.users}");
    final users = (response.data as List)
        .map((user) => Usermodel.fromjson(user))
        .toList();
    return users;
  }

  static Future<Usermodel?> checkemailandpass(
      String email, String password) async {
    List<Usermodel> user = await getusers();
    for (var item in user) {
      if (item.email == email && item.password == password) {
        return item;
      }
    }
    return null;
  }
}
