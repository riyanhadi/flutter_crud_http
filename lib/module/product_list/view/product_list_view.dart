import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_crud_http/core.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("ProductList"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Text(
              "${controller.products.length}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () => controller.generateDummy(),
            icon: Icon(
              Icons.data_array,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.products.length,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> item = controller.products[index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (detail) {},
                    confirmDismiss: (direction) async {
                      bool confirm = false;
                      await showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  Text(
                                      'Are you sure you want to delete this item?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                ),
                                onPressed: () {
                                  confirm = true;
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                      if (confirm) {
                        controller.doDelete(item["id"]);
                        return Future.value(true);
                      }
                      return Future.value(false);
                    },
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          await Get.to(ProductFormView(item: item));
                          controller.getProducts();
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: NetworkImage(
                            item["photo"],
                          ),
                        ),
                        title: Text(item["product_name"]),
                        subtitle: Text("${item["price"]} USD"),
                      ),
                    ).animate(delay: 1000.ms).fadeIn(delay: 500.ms),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 24.0,
        ),
        onPressed: () async {
          await Get.to(ProductFormView());
          controller.getProducts();
        },
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
