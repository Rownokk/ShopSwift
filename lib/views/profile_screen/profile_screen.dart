
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/services/firebase_services.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_card.dart';
import 'package:emart_app/views/profile_screen/edit_profile_screen.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs.isNotEmpty ? snapshot.data!.docs[0].data() as Map<String, dynamic> : {};

              return SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.nameController.text = data['name'] ?? '';
                          controller.passController.text = data['password'] ?? '';
                          Get.to(() => EditProfileScreen(data: data));
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit, color: redColor),
                        ),
                      ),
                      10.heightBox, // Add spacing after the GestureDetector
                      Row(
                        children: [
                          data['imageUrl'] == null || data['imageUrl'] == ""
                              ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make()
                              : Image.network(data['imageUrl'], width: 100, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data["name"]}".text.semiBold.color(Colors.red).make(),
                                "${data['email']}".text.color(Colors.red).make(),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: redColor,
                              ),
                            ),
                            onPressed: () {
                              Get.put(AuthController()).signoutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontWeight: FontWeight.bold,
                                color: redColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(count: data['card_count']?.toString() ?? "0", title: "in your cart", width: context.screenWidth / 3.4),
                          detailsCard(count: data['wishlist_count']?.toString() ?? "0", title: "in your wishlist", width: context.screenWidth / 3.4),
                          detailsCard(count: data['order_count']?.toString() ?? "0", title: "your orders", width: context.screenWidth / 3.4),
                        ],
                      ),
                      40.heightBox,
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Divider(color: lightGrey);
                        },
                        itemCount: profileButtonList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(profileButtonsIcon[index], width: 22),
                            title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                          );
                        },
                      ).box.white.rounded.padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}


