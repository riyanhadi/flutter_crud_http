import 'package:dio/dio.dart';
import 'dart:math';
import 'package:faker_dart/faker_dart.dart';

class ProductService {
  Future<List> getProducts() async {
    var response = await Dio().get(
      "https://capekngoding.com/089679884144/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }

  generateDummy() async {
    await Dio().delete(
      "https://capekngoding.com/089679884144/api/products/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    for (var i = 0; i < 10; i++) {
      final faker = Faker.instance;
      print(faker.image.loremPicsum.image());
      await Dio().post(
        "https://capekngoding.com/089679884144/api/products",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "photo":
              "https://source.unsplash.com/random/?${faker.commerce.productName()}",
          "product_name": faker.commerce.productName(),
          "price": Random().nextInt(100),
          "category": faker.commerce.productAdjective(),
          "description": faker.commerce.productDescription(),
        },
      );
    }
  }
}
