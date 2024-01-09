import 'item_details.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categories = [];

    switch (title) {
      case "Sweaters":
        categories = ["Pullover", "Cardigan", "Turtleneck", "Crewneck", "V-Neck", "Cable-Knit Sweater"];
        break;
      case "Shoes":
        categories = ["Keds", "Slippers", "Sandals", "Boots", "Formal Shoes", "Heels"];
        break;
      case "Long Dresses":
        categories = ["Maxi Dress", "Ball Gown", "A-Line Dress", "Empire Waist Dress", "Kaftan Dress", "Frocks"];
        break;
      case "Sharees":
        categories = [
          "Banarasi Saree",
          "Kanjivaram Saree",
          "Dhakai Jamdani Saree",
          "Bandhani Saree",
          "Chanderi Saree",
          "Tant Saree"
        ];
        break;
      case "Shirts":
        categories = ["Button-Down Shirt", "Polo Shirt", "T-Shirt", "Henley Shirt", "Dress Shirt", "Flannel Shirt"];
        break;
      case "Pants":
        categories = ["Jeans", "Chinos", "Leggings", "Palazzo Pants", "Cargo Pants", "Culottes"];
        break;
      case "Skirts":
        categories = ["A-line Skirt", "Pencil Skirt", "Maxi Skirt", "Wrap Skirt", "Pleated Skirt", "Midi Skirt"];
        break;
      case "Makeup":
        categories = ["Foundation", "Lipstick", "Eyeshadow", "Mascara", "Blush", "Eyeliner"];
        break;
      case "Accessories":
        categories = ["Earrings", "Necklaces", "Bracelets", "Scarves", "Sunglasses", "Hats"];
        break;
    }

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              categories.isNotEmpty
                  ? Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: categories.map((categoryText) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => BarsDetails(category: categoryText, backgroundColor: Colors.transparent));
                          },
                          child: categoryText
                              .text
                              .size(24)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .rounded
                              .height(80)
                              .width(300)
                              .margin(const EdgeInsets.symmetric(vertical: 16))
                              .make(),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class BarsDetails extends StatelessWidget {
  final String category;
  final Color backgroundColor;

  const BarsDetails({Key? key, required this.category, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, dynamic>>> categoryData = {

    'Pullover': [
    {
    "name": "Sleek Elegance ",
    "price": "\$49.99",
    "image": "https://image26.stylesimo.com/o_img/2017/07/10/228957-10340137/women-s-high-neck-knitted-long-sleeve-pullover-long-sweater.jpg"
    },
    {
    "name": "Urban Vogue Knit",
    "price": "\$39.95",
    "image": "https://i5.walmartimages.com/asr/b3a72203-e67f-4c99-a297-79ea859443f9_1.79b21612abfdd1acc4ab35b66c7a1b51.jpeg"
    },
    {
    "name": "Chic Comfort ",
    "price": "\$69.99",
    "image": "https://i5.walmartimages.com/asr/746060dd-2585-43e1-9ead-23a13bce761f.96ecd2c1b1f5177770e3a10fe4f5ca24.jpeg"
    },
    {
    "name": "Cosmopolitan Cozy",
    "price": "\$54.50",
    "image": "https://i.pinimg.com/originals/b8/91/95/b89195f74bb2893f45d60ed77295958f.jpg"
    },
    {
    "name": "Trendsetters",
    "price": "\$79.95",
    "image": "https://image28.stylesimo.com/o_img/2018/08/29/257170-10567171/stripe-women-s-high-neck-long-sleeve-color-block-loose-pullover-sweatshirt.jpg"
    },
    {
    "name": "Luxury Blend Crew",
    "price": "\$89.99",
    "image": "https://aknittingblog.com/wp-content/uploads/2014/03/Knit-Ribbed-Cardigan-Pattern-For-Women.jpg"
    },
    ],
    'Cardigan': [
    {
    "name": "Velvet Blossom ",
    "price": "\$59.99",
    "image": "https://content.woolovers.com/img/o/71853-45472_t134l_white_w_20.jpg"
    },
    {
    "name": "Sophisticate Wrap",
    "price": "\$45.50",
    "image": "https://i5.walmartimages.com/asr/0943e2a6-a77d-4154-8475-489414a3a9b8_1.4042d5fd63797494254546ca6dd32dc9.jpeg"
    },
    {
    "name": "Enchanting Lace",
    "price": "\$79.95",
    "image": "https://i5.walmartimages.com/asr/17ce6dfe-776c-47b8-a030-62fa92fa2305_1.1bf02d03f0e4f5a4a43e35098b9ecd5a.jpeg"
    },
    {
    "name": "City Lights Shrug",
    "price": "\$64.99",
    "image": "https://i.pinimg.com/originals/b1/36/fb/b136fb45565a999a82278eb29c805334.jpg"
    },
    {
    "name": "Ethereal Elegance ",
    "price": "\$89.95",
    "image": "https://i5.walmartimages.com/asr/6a757426-9a06-488e-97d2-e4c47b7c625f_1.2ce542303078423b8fa68acfee36fb5c.jpeg"
    },
    {
    "name": "Cashmere Cascade ",
    "price": "\$129.00",
    "image": "https://i.pinimg.com/originals/10/a0/7b/10a07b42a5395580fcadf0047f42f62d.jpg"
    },
    ],
    'Turtleneck': [
    {
    "name": "Cozy Haven ",
    "price": "\$39.99",
    "image": "https://cdna.lystit.com/photos/b052-2014/08/13/ralph-lauren-black-label-white-cashmere-silk-turtleneck-product-1-22447643-2-603305213-normal.jpeg"
    },
    {
    "name": "Urban Luxe Knit",
    "price": "\$49.95",
    "image": "https://cdna.lystit.com/photos/2013/04/21/splendid-black-knit-turtleneck-product-1-8062951-676646362.jpeg"
    },
    {
    "name": "Chic Retreat ",
    "price": "\$59.99",
    "image": "https://cdnd.lystit.com/photos/2013/04/19/ralph-lauren-blue-label-newport-navy-turtleneck-sweater-product-2-7954297-226558747.jpeg"
    },
    {
    "name": "Velvet Embrace ",
    "price": "\$69.50",
    "image": "https://images.bonanzastatic.com/afu/images/cbe7/f3d5/8b55_7705286606/__57.jpg"
    },
    {
    "name": "Modern Elegance",
    "price": "\$79.95",
    "image": "https://i5.walmartimages.com/asr/49eaac33-a151-4c85-922e-eccb08db2657_1.be04381d91ffa73d6d83025cda2965e6.jpeg"
    },
    {
    "name": "Cashmere Bliss",
    "price": "\$129.00",
    "image": "https://i.pinimg.com/originals/db/b1/ef/dbb1ef07492171535f87ce94aaea2e95.jpg"
    },
    ],
    'Crewneck': [
    {
    "name": "Urban Chic Crew",
    "price": "\$34.99",
    "image": "https://content.woolovers.com/img/747x856/43201_q35l_pinklace_w_5.jpg"
    },
    {
    "name": "Vogue Vertex Crew",
    "price": "\$45.50",
    "image": "https://content.backcountry.com/images/items/1200/BCC/BCC007Y/LTGREHE.jpg"
    },
    {
    "name": "Modish Mariner",
    "price": "\$59.95",
    "image": "https://cdn.shopify.com/s/files/1/1007/6022/products/SW_CN12_CWNK_MRLRDBK_1.jpg?v=1590793958"
    },
    {
    "name": "Streetwise Knit",
    "price": "\$49.99",
    "image": "https://content.woolovers.com/img/747x856/16923_q19l_teal_w_20.jpg"
    },
    {
    "name": "Trendset Crew",
    "price": "\$69.95",
    "image": "https://cdn.woolovers.com/img/747x856/18089_c53l_mochabrown_w_5.jpg"
    },
    {
    "name": "Posh Essentials ",
    "price": "\$89.99",
    "image": "https://content.woolovers.com/img/o/43151_q37l_black_w_4.jpg"
    },
    ],
    'V-Neck': [
    {
    "name": "Sleek Silhouette ",
    "price": "\$59.99",
    "image": "https://content.woolovers.com/img/o/20308_a20l_navy_w_1.jpg"
    },
    {
    "name": "Urban Charm ",
    "price": "\$45.50",
    "image": "https://cdn.shopify.com/s/files/1/1610/7389/products/pcw002-brown-3-1.jpg?v=1548275735"
    },
    {
    "name": "Ethereal Elegance ",
    "price": "\$59.95",
    "image": "https://i.pinimg.com/originals/39/23/b0/3923b0fde8cdecaa032e9ea6418c3124.jpg"
    },    {
    "name": "Velvet Touch ",
    "price": "\$49.99",
    "image": "https://cdna.lystit.com/photos/1299-2015/12/24/gap-new-classic-navy-marled-v-neck-sweater-blue-product-0-848977246-normal.jpeg"
    },
    {
    "name": "Contemporary Chic ",
    "price": "\$69.95",
    "image": "https://content.woolovers.com/img/o/c10ac-44619_t119l_fadedblue_w_2.jpg"
    },
    {
    "name": "Luxury Linen ",
    "price": "\$89.99",
    "image": "https://i5.walmartimages.com/asr/76bc23f8-b5a3-4948-a256-30f1095e4f3e_1.342c857bcbd588b4ca035c2afc784156.jpeg"
    },
    ],  };
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
