import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: mediumPeachyPinkColor,
      width: context.screenWidth,
      height:context.screenHeight,
      child: SafeArea(child:Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            color: mediumPeachyPinkColor,
            child: TextFormField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                hintText:searchanything,
                hintStyle: TextStyle(color: redColor),

              ),
            ),
          ),
          VxSwiper.builder(
              aspectRatio:16/9 ,
              autoPlay: true,
              height:150,
              enlargeCenterPage: true,
              itemCount:slidersList.length, itemBuilder: (context,index){
            return Image.asset(slidersList[index],fit:BoxFit.fitWidth ,

            ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
          }),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:List.generate(2,
                    (index) => homeButtons(
                  height: context.screenHeight*0.15,
                  width: context.screenWidth/2.5,
                  icon: index==0?icTodaysDeal:icFlashDeal,
                  title: index==0?todayDeal:flashsale,
                )) ,
          ),
          10.heightBox,
          VxSwiper.builder(
              aspectRatio:16/9 ,
              autoPlay: true,
              height:150,
              enlargeCenterPage: true,
              itemCount:secondSlidersList.length, itemBuilder: (context,index){
            return Image.asset(secondSlidersList[index],fit:BoxFit.fitWidth ,

            ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
          }),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) => homeButtons(
              height: context.screenHeight*0.15,
              width: context.screenWidth/3.5,
              icon: index==0?icTopCategories:index==1?icBrands:icTopSeller,
              title: index==0?topCategories: index==1?brand:topSellers,
            )),
          ),
        ],
      )),
    );
  }
}
