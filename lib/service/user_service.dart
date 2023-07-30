import 'package:dio/dio.dart';
import 'package:flutter_crud_http/core.dart';

class UserService {
  Future<List> getUsers() async {
    var response = await Dio().get(
      "https://capekngoding.com/6289679884144/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }

  create({
    required String nama,
    required String email,
    required int phone,
    required String alamat,
    required String avatar,
    required String username,
    required String password,
  }) async {
    var response = await Dio().post(
      "https://capekngoding.com/6289679884144/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "nama": nama,
        "email": email,
        "phone": phone,
        "alamat": alamat,
        "avatar": avatar,
        "username": username,
        "password": password,
      },
    );
    Map obj = response.data;
  }

  update({
    required int id,
    required String nama,
    required String email,
    required int phone,
    required String alamat,
    required String avatar,
    required String username,
    required String password,
  }) async {
    var response = await Dio().post(
      "https://capekngoding.com/6289679884144/api/users/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "nama": nama,
        "email": email,
        "phone": phone,
        "alamat": alamat,
        "avatar": avatar,
        "username": username,
        "password": password,
      },
    );
    Map obj = response.data;
  }

  delete(int id) async {
    var response = await Dio().delete(
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      "https://capekngoding.com/6289679884144/api/users/$id",
    );
    print(response.statusCode);
  }
}
