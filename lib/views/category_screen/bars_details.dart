import 'item_details.dart';
import 'package:emart_app/consts/consts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BarsDetails extends StatelessWidget {
  final String category;
  final Color backgroundColor;

  const BarsDetails({Key? key, required this.category, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, dynamic>>> categoryData = {


       };
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Container(
        color: backgroundColor,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: category.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 250,
                ),
                itemBuilder: (context, index) {
                  String itemName = categoryData[category]![index]["name"];
                  String itemPrice = categoryData[category]![index]["price"];
                  String itemImage = categoryData[category]![index]["image"];

                  return GestureDetector(
                      onTap: () {
                        Get.to(() => ItemDetails(title: itemName));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            itemImage,
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          10.heightBox,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                itemName.text.fontFamily(semibold).color(darkFontGrey).make(),
                                5.heightBox,
                                "$itemPrice".text.color(redColor).fontFamily(bold).size(16).make(),
                              ],
                            ),
                          ),
                        ],
                      )
                          .box
                          .white
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM
                          .outerShadowSm
                          .padding(const EdgeInsets.all(12))
                          .make());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
