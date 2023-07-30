import 'package:flutter/material.dart';
import 'package:flutter_crud_http/service/user_service.dart';
import 'package:flutter_crud_http/state_util.dart';
import '../view/user_form_view.dart';

class UserFormController extends State<UserFormView> {
  static late UserFormController instance;
  late UserFormView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      nama = widget.user!["nama"];
      email = widget.user!["email"];
      phone = widget.user!["phone"];
      alamat = widget.user!["alamat"];
      avatar = widget.user!["avatar"];
      username = widget.user!["username"];
      password = widget.user!["password"];
    }
    super.initState();
  }

  bool get isEditMode => widget.user != null;

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? nama;
  String? email;
  int phone = 628967984144;
  String? alamat;
  String? avatar;
  String? username;
  String? password;

  doSave() async {
    if (isEditMode) {
      await UserService().update(
        id: widget.user!["id"],
        nama: nama!,
        email: email!,
        phone: phone,
        alamat: alamat!,
        avatar: avatar!,
        username: username!,
        password: password!,
      );
    } else {
      await UserService().create(
        nama: nama!,
        email: email!,
        phone: phone,
        alamat: alamat!,
        avatar: avatar!,
        username: username!,
        password: password!,
      );
    }

    Get.back();
  }
}
