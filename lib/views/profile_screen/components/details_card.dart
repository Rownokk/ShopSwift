import 'package:emart_app/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(Colors.black).size(16).make(),
      5.heightBox,
      title!.text.color(Colors.black).make(),
    ],
  ).box.white.rounded.width(width).height(80).padding(const EdgeInsets.all(4)).make();
}
