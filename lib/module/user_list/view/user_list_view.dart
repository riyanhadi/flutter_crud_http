import 'package:flutter/material.dart';
import 'package:flutter_crud_http/core.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  Widget build(context, UserListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        actions: [
          IconButton(
            onPressed: () => controller.getUsers(),
            icon: Text(
              "${controller.users.length}",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: whiteColor),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.users.length,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> user = controller.users[index];
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
                                children: <Widget>[
                                  Text("Yakin menghapus user ${user["nama"]}?"),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: secondaryColor,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: dangerColor,
                                ),
                                onPressed: () {
                                  confirm = true;
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      if (confirm) {
                        controller.doDelete(user["id"]);
                        return Future.value(true);
                      }
                      return Future.value(false);
                    },
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          await Get.to(UserFormView(user: user));
                          controller.getUsers();
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: NetworkImage(
                            (user["avatar"] != "")
                                ? user["avatar"]
                                : "https://smkassaidiyah.prospak.id/img/blank.png",
                          ),
                        ),
                        title: Text(user["nama"]),
                        subtitle: Text(user["email"]),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 24.0,
        ),
        onPressed: () async {
          await Get.to(UserFormView());
          controller.getUsers();
        },
      ),
    );
  }

  @override
  State<UserListView> createState() => UserListController();
}
