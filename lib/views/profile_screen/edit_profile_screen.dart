import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    String imageUrl = data['imageUrl'] ?? "";
    String profileImagePath = controller.profileImagePath.value ?? "";

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
              () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (imageUrl.isEmpty && profileImagePath.isEmpty)
                  ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make()
                  : (imageUrl.isNotEmpty && profileImagePath.isEmpty)
                  ? Image.network(imageUrl, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make()
                  : Image.file(File(profileImagePath), width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              10.heightBox,
              ourButton(
                color: redColor,
                onPress: () {
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "change",
              ),
              const Divider(),
              10.heightBox,
              customTextField(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false,
              ),
              customTextField(
                controller: controller.passController,
                hint: passwordHint,
                title: password,
                isPass: true,
              ),
              10.heightBox,
              controller.isloading.value
                  ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              )
                  : SizedBox(
                width: context.screenWidth - 40,
                child: ourButton(
                  color: redColor,
                  onPress: () async {
                    controller.isloading(true);
                    await controller.uploadProfileImage();
                    await controller.updateProfile(
                      imgUrl: controller.profileImageLink,
                      name: controller.nameController.text,
                      password: controller.passController.text,
                    );
                    VxToast.show(context, msg: "updated");
                  },
                  textColor: whiteColor,
                  title: "Save",
                ),
              ),
            ],
          ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50, left: 12, right: 12)).rounded.make(),
        ),
      ),
    );
  }
}

