import 'package:flutter/material.dart';
import 'package:flutter_crud_http/core.dart';

class ProductFormController extends State<ProductFormView>
    implements MvcController {
  static late ProductFormController instance;
  late ProductFormView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      photo = widget.item!["photo"];
      productName = widget.item!["product_name"];
      price = widget.item!["price"];
      category = widget.item!["category"];
      description = widget.item!["description"];
    }
    super.initState();
  }

  bool get isEditMode => widget.item != null;

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? photo;
  String? productName;
  String? category;
  num? price;
  String? description;

  doSave() async {
    if (isEditMode) {
      await ProductService().update(
        id: widget.item!["id"],
        photo: photo!,
        productName: productName!,
        price: price!,
        category: category!,
        description: description!,
      );
    } else {
      await ProductService().create(
        photo: photo!,
        productName: productName!,
        price: price!,
        category: category!,
        description: description!,
      );
    }

    Get.back();
  }
}
