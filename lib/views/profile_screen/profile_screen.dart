import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_card.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Your onTap logic here
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.edit, color:redColor),
                  ),
                ),
                10.heightBox, // Add spacing after the GestureDetector
                Row(
                  children: [
                    Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Customer".text.semiBold.black.make(),
                          "customer@gmail.com".text.black.make(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: redColor,
                        ),
                      ),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(()=>const LoginScreen());
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: 'semibold', // Replace with your desired font family
                          fontWeight: FontWeight.bold, // FontWeight for semibold
                          color:redColor,
                        ),
                      ),
                    ),
                  ],
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detailsCard(count: "00", title: "in your cart", width: context.screenWidth / 3.4),
                    detailsCard(count: "32", title: "in your wishlist", width: context.screenWidth / 3.4),
                    detailsCard(count: "675", title: "your orders", width: context.screenWidth / 3.4),
                  ],
                ),
                40.heightBox,
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context,index){
                    return const Divider(
                      color: lightGrey
                    );
                  },
                  itemCount: profileButtonList.length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      leading: Image.asset(
                      profileButtonsIcon[index],
                      width:22,
                      ),
                      title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                    );
                  },
                  
                ).box.white.rounded.padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}