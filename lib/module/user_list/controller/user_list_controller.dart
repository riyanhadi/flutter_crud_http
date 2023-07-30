import 'package:flutter/material.dart';
import 'package:flutter_crud_http/service/user_service.dart';
import '../view/user_list_view.dart';

class UserListController extends State<UserListView> {
  static late UserListController instance;
  late UserListView view;

  @override
  void initState() {
    instance = this;
    getUsers();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List users = [];
  getUsers() async {
    users = await UserService().getUsers();
    setState(() {});
  }

  doDelete(int id) async {
    await UserService().delete(id);
    await getUsers();
  }
}
