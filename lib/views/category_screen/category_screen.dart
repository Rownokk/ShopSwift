import 'category_details.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return buildCategoryItem(context, index);
            },
          ),
        ),
      ),
    );
  }

  Widget buildCategoryItem(BuildContext context, int index) {
    String imagePath;
    String categoryText;

    switch (index) {
      case 0:
        imagePath = 'https://i5.walmartimages.com/asr/868f793b-50f4-490f-9bda-ce4c5849951e_1.ffd074bfcfa4c2c4d703e6ed74b79880.jpeg';
        categoryText = 'Sweaters';
        break;
      case 1:
        imagePath = 'https://cucufashionimg.linevast-hosting.in/images/JH-08LTGREEN__3.jpg';
        categoryText = 'Shoes';
        break;
      case 2:
        imagePath = 'https://i5.walmartimages.com/asr/29c1f888-a5f2-4f5d-a64c-09ae26a1a553.364c8392be2409dc77a8208d0873eb0f.jpeg';
        categoryText = 'Long Dresses';
        break;
      case 3:
        imagePath = 'https://rsmsilksonline.com/wp-content/uploads/2020/12/WhatsApp-Image-2020-12-30-at-12.28.03-AM.jpeg';
        categoryText = 'Sharees';
        break;
      case 4:
        imagePath = 'https://i5.walmartimages.com/asr/32ebf04d-dbcb-4969-b802-aea2710b32a4_1.af638d671c3eb2319d28c364582c4d02.jpeg';
        categoryText = 'Shirts';
        break;
      case 5:
        imagePath = 'https://i5.walmartimages.com/asr/2352cd2b-8b74-4aa2-84af-e6ab61a64fbe.6c3dfb0f93b634fd33feec15b9218e26.jpeg';
        categoryText = 'Pants';
        break;
      case 6:
        imagePath = 'https://i.etsystatic.com/5609612/r/il/b41f70/1085059665/il_1588xN.1085059665_hsge.jpg';
        categoryText = 'Skirts';
        break;
      case 7:
        imagePath = 'https://s14354.pcdn.co/wp-content/uploads/2019/08/jazmin-quaynor-FoeIOgztCXo-unsplash.jpg';
        categoryText = 'Makeup';
        break;
      case 8:
        imagePath = 'https://images.creativemarket.com/0.1.0/ps/3763165/1820/1466/m1/fpnw/wm1/mtgy1denzgfzalhgrid4iy5x4renf7tkhif3ubjzqkmclmvz5vo1gavoyxqht5tp-.jpg?1513841434&s=01514747aae43172b41e61b357ccbbbe';
        categoryText = 'Accessories';
        break;
      default:
        imagePath = '';
        categoryText = '';
        break;
    }

    return GestureDetector(
      onTap: () {
        Get.to(() => CategoryDetails(title: categoryText));
      },
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 8),
          Text(
            categoryText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make(),
    );
  }
}
