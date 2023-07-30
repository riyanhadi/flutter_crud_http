import 'package:flutter/material.dart';
import 'package:flutter_crud_http/core.dart';

class UserFormView extends StatefulWidget {
  final Map? user;
  const UserFormView({Key? key, this.user}) : super(key: key);

  Widget build(context, UserFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Form"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              QTextField(
                label: "Nama",
                validator: Validator.required,
                value: controller.nama,
                onChanged: (value) {
                  controller.nama = value;
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              QTextField(
                label: "Email",
                validator: Validator.email,
                suffixIcon: Icons.email,
                value: controller.email,
                onChanged: (value) {
                  controller.email = value;
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              QNumberField(
                label: "Phone",
                validator: Validator.required,
                value: controller.phone?.toString(),
                onChanged: (value) {
                  controller.phone = int.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              QMemoField(
                label: "Alamat",
                validator: Validator.required,
                value: controller.alamat,
                onChanged: (value) {
                  controller.alamat = value;
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              QImagePicker(
                label: "Avatar",
                validator: Validator.required,
                value: controller.avatar,
                onChanged: (value) {
                  controller.avatar = value;
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              QTextField(
                label: "Username",
                validator: Validator.required,
                value: controller.username,
                onChanged: (value) {
                  controller.username = value;
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              QTextField(
                label: "Password",
                obscure: true,
                validator: Validator.required,
                suffixIcon: Icons.password,
                value: controller.password,
                onChanged: (value) {
                  controller.password = value;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          onPressed: () => controller.doSave(),
          child: Text(
            "Simpan",
            style: TextStyle(color: whiteColor),
          ),
        ),
      ),
    );
  }

  @override
  State<UserFormView> createState() => UserFormController();
}
