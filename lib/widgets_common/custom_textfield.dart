import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
Widget customTextField({String? title,String?hint,controller,isPass}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.pink
                )
            )
        ),
      ),
      5.heightBox,
    ],
  );
}