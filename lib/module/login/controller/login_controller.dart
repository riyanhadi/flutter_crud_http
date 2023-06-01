import 'package:flutter/material.dart';
import 'package:flutter_crud_http/core.dart';
import 'package:flutter_crud_http/service/auth_service.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "admin@demo.com";
  String password = "123456";

  void doLogin() async {
    showLoading();
    var isSuccess = await AuthService.login(
      email: email,
      password: password,
    );
    hideLoading();

    if (!isSuccess) {
      showInfoDialog("Email dan password salah");
      return;
    }

    Get.offAll(ProductListView());
  }
}
