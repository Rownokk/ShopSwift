import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.off(LoginScreen());

    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    changeScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mediumPeachyPinkColor,
        body: Center(
            child:Column(
              children: [
                Align( alignment: Alignment.topLeft,child:Image.asset(icSplashBg,width: 300)),
                20.heightBox,
                applogoWidget(),
                10.heightBox,
                appname.text.fontFamily(bold).size(22).pink900.make(),
                5.heightBox,
                appversion.text.pink900.make(),
                const Spacer(),
                credits.text.pink900.fontFamily(semibold).make(),
                30.heightBox,

              ],
            )
        )
    );
  }
}
