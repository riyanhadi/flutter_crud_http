import 'package:dio/dio.dart';

class AuthService {
  static Future<bool> login(
      {required String email, required String password}) async {
    var response = await Dio().post(
      "https://capekngoding.com/089679884144/api/auth/action/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": email,
        "password": password,
      },
    );
    Map obj = response.data;
    return obj["success"];
  }
}
