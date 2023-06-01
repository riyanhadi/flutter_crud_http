import 'package:flutter/material.dart';
import 'package:flutter_crud_http/service/product_service.dart';
import 'package:flutter_crud_http/state_util.dart';
import '../view/product_list_view.dart';

class ProductListController extends State<ProductListView>
    implements MvcController {
  static late ProductListController instance;
  late ProductListView view;

  @override
  void initState() {
    instance = this;
    getProducts();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List products = [];
  getProducts() async {
    products = await ProductService().getProducts();
    setState(() {});
  }

  generateDummy() async {
    await ProductService().generateDummy();
    await getProducts();
    setState(() {});
  }

  doDelete(int id) async {
    await ProductService().delete(id);
    await getProducts();
  }
}
