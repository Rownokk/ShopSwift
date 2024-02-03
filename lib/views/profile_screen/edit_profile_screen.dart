import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';


class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({Key? key, required this.data});

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    String imageUrl = data['imageUrl'] ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Obx(
            () => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            (imageUrl.isEmpty)
                ? Image.asset('assets/images/profile.png', width: 100, fit: BoxFit.cover)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make()
                : Image.network(imageUrl, width: 100, fit: BoxFit.cover)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make(),
            10.heightBox,
            ourButton(
              color: Colors.red,
              onPress: () {
                controller.changeImage(context);
              },
              textColor: Colors.white,
              title: "Change",
            ),
            const Divider(),
            10.heightBox,
            customTextField(
              controller: controller.nameController,
              hint: "Name",
              title: "Name",
              isPass: false,
            ),
            customTextField(
              controller: controller.passController,
              hint: "Password",
              title: "Password",
              isPass: true,
            ),
            10.heightBox,
            controller.isloading.value
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
            )
                : SizedBox(
              width: context.screenWidth - 40,
              child: ourButton(
                color: Colors.red,
                onPress: () async {
                  controller.isloading(true);
                  await controller.uploadProfileImage();
                  await controller.updateProfile(
                    imgUrl: controller.profileImageLink,
                    name: controller.nameController.text,
                    password: controller.passController.text,
                  );
                  showToast("Updated");
                },
                textColor: Colors.white,
                title: "Save",
              ),
            ),
          ],
        ).box
            .white
            .shadowSm
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    );
  }
}



