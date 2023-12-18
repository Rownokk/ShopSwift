import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
Widget homeButtons({width,height,icon,String? title,onPress}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 26),
      10.heightBox,
      title!.text.fontFamily(bold).color(Colors.pink).make()
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}