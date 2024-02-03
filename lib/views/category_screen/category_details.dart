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
                          Get.to(() => BarsDetails(
                            category: categoryText,
                            backgroundColor: Colors.transparent,
                          ));
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

      ],
      'V-Neck': [
        {
          "name": "Sleek Silhouette ",
          "price": "\$59.99",
          "image": "https://content.woolovers.com/img/o/20308_a20l_navy_w_1.jpg"
        },
        {
          "name": "Urbanize",
          "price": "\$45.50",
          "image": "https://cdn.shopify.com/s/files/1/1610/7389/products/pcw002-brown-3-1.jpg?v=1548275735"
        },
        {
          "name": "Ethereal Elegance ",
          "price": "\$59.95",
          "image": "https://i.pinimg.com/originals/39/23/b0/3923b0fde8cdecaa032e9ea6418c3124.jpg"
        }, {
          "name": "Velvet Touch ",
          "price": "\$49.99",
          "image": "https://cdna.lystit.com/photos/1299-2015/12/24/gap-new-classic-navy-marled-v-neck-sweater-blue-product-0-848977246-normal.jpeg"
        },

      ],
      'Cable-Knit Sweater':

      [{"name": "Classic Cable",

        "price": "\$79.99",
        "image": "https://cdn.tobi.com/product_images/lg/1/taupe-driftwood-cable-knit-sweater.jpg"},

        {"name": "Elegant Twis",
          "price": "\$94.99",
          "image": "https://aknittingblog.com/wp-content/uploads/2014/03/Irish-Cable-Knit-Sweater-Pattern.jpg"}
        ,
        { "name": "Modern Cable",
          "price": "\$87.50",
          "image": "https://content.woolovers.com/img/o/49416_b78l_neonavy_w_5.jpg"},

        {"name": "Timeless ",

          "price": "\$99.95",
          "image": "https://gap-fe-prod-cdn-1.mnpcdn.ae/small_light(p=zoom,of=jpg,q=70)/pub/media/catalog/product/2/1/213136643_473972_01_in.jpg?1572536655.5504"},
      ],

      'Keds': [
        {
          "name": "Casual Canvas",
          "price": "\$49.99",
          "image": "https://i5.walmartimages.com/asr/0e93b1c7-82e9-4b58-be15-e0fbcc3c7779_1.182e89850ce504513d6fdf379a643f92.jpeg"
        },
        {
          "name": "Street Sneakers",
          "price": "\$39.95",
          "image": "https://i5.walmartimages.com/asr/362f1d76-5527-43bd-8d5c-ae87a34e758d.b814b1ba9b27d112c4e1c8c7fa91d869.jpeg"
        },
        {
          "name": "Fashion Flats",
          "price": "\$69.99",
          "image": "https://cdnc.lystit.com/photos/macys/2740290-Charcoal-faed6d59-.jpeg"
        },
        {
          "name": "Chic Slip-Ons",
          "price": "\$54.50",
          "image": "https://cdnc.lystit.com/photos/2012/01/07/keds-brown-keds-womens-startup-ltt-lace-up-fashion-sneaker-product-1-2676487-671294406.jpeg"
        },
      ],
      'Slippers': [
        {
          "name": "Cozy Comfort",
          "price": "\$29.99",
          "image": "https://i5.walmartimages.com/asr/715e0f25-28fe-446c-b571-0436056eaa16.d016fc73bb62008e0b641f3fc0255e36.jpeg"
        },
        {
          "name": "Velvet Slides",
          "price": "\$19.95",
          "image": "https://images-na.ssl-images-amazon.com/images/I/61Z%2B4aaIarS._AC_UL1500_.jpg"
        },
        {
          "name": "Furry Flip",
          "price": "\$39.99",
          "image": "https://pictures.nelson.nl/images/productimages/2/27/278/27803830-31/27803830-31-1-1500.jpg"
        },
        {
          "name": "Luxury Lounge",
          "price": "\$44.50",
          "image": "https://i5.walmartimages.com/asr/b3f40cc0-cb70-46df-a36d-648405054f73.95c37d716c97907c4c0394f8f8ac17e4.jpeg?odnWidth=1000&odnHeight=1000&odnBg=ffffff"
        },
      ],

      'Sandals': [
        {
          "name": "Summer Strappy",
          "price": "\$39.99",
          "image": "https://images-na.ssl-images-amazon.com/images/I/61G3jyJFKmL.jpg"
        },
        {
          "name": "Trendy Sandals",
          "price": "\$29.95",
          "image": "https://i5.walmartimages.com/asr/8c692a17-18d2-4cfd-8764-d37a7bc811a4_1.16b00bc348fe3d7f97ad5b56cace3cb0.jpeg"
        },
        {
          "name": "Flip-Flops",
          "price": "\$49.99",
          "image": "https://i.pinimg.com/originals/a9/72/20/a97220ef6a78f365eee8e4076b495fac.png"
        },
        {
          "name": "Elegant Heels",
          "price": "\$64.50",
          "image": "https://static.shiekh.com/media/catalog/product/cache/image/2000x2000/e9c3970ab036de70892d86c6d221abfe/2/7/2775d404f69589e6311860c5dd79328a.jpg"
        },
      ],

      'Boots': [
        {
          "name": "Ankle Boots",
          "price": "\$79.99",
          "image": "https://www.countryoutfitter.com/on/demandware.static/-/Sites-master-product-catalog-shp/default/dwf5955b1c/images/102/030102_41_P1.JPG"
        },
        {
          "name": "Snow Boots",
          "price": "\$89.95",
          "image": "https://i5.walmartimages.com/asr/6d9ba645-f963-484f-8c3c-800006e41b0f_1.7de3b9a6e0cad9293bbec9efc0e1910a.jpeg"
        },
        {
          "name": "Knee-Highs",
          "price": "\$99.99",
          "image": "https://d3d71ba2asa5oz.cloudfront.net/12013008/images/f11_brown_new_yuan__3.jpg"
        },
        {
          "name": "Urban Boots",
          "price": "\$74.50",
          "image": "https://cdna.lystit.com/photos/2013/01/07/frye-brown-tall-leather-harness-boots-product-1-5947209-564918827.jpeg"
        },
      ],
      'Formal Shoes': [
        {
          "name": "Timeless ",
          "price": "\$89.99",
          "image": "https://images-na.ssl-images-amazon.com/images/I/71u4qs2rZiL.jpg"
        },
        {
          "name": "Classic Black",
          "price": "\$79.95",
          "image": "https://i.pinimg.com/originals/b0/a5/e1/b0a5e183ca1fe51852c902c2c69631d8.jpg"
        },
        {
          "name": "Modern Busi",
          "price": "\$109.99",
          "image": "https://i.pinimg.com/originals/a0/54/86/a054869663011236a72d8630abe3646b.jpg"
        },
        {
          "name": "Derby Shoes",
          "price": "\$94.50",
          "image": "https://images-na.ssl-images-amazon.com/images/I/71hAQi8OQ0L._AC_UL1500_.jpg"
        },
      ],

      'Heels': [
        {
          "name": "Sleek Pumps",
          "price": "\$79.99",
          "image": "https://cdnc.lystit.com/photos/6e6a-2015/11/05/river-island-black-black-lace-up-platform-heels-product-0-295819667-normal.jpeg"
        },
        {
          "name": "Strap Sandals",
          "price": "\$69.95",
          "image": "https://i.pinimg.com/originals/ad/17/7b/ad177b163db75d08fda0ed65ec8b6bfd.jpg"
        },
        {
          "name": "Heel Boots",
          "price": "\$89.99",
          "image": "https://i.pinimg.com/originals/23/b9/c4/23b9c485813d0ed877c425b8280d8511.jpg"
        },
        {
          "name": "Peep-Toe Heels",
          "price": "\$104.50",
          "image": "https://i.pinimg.com/originals/47/be/a1/47bea13e8d8951874b6c93215778176d.jpg"
        },
      ],
      'Maxi Dress': [
        {
          "name": "Bohemian Maxi",
          "price": "\$69.99",
          "image": "https://www.allseams.com/wp-content/uploads/2019/04/linen-maxi-dress-001--scaled.jpg"
        },
        {
          "name": "Floral Maxi",
          "price": "\$59.95",
          "image": "https://trendyplusdress.com/wp-content/uploads/pink-maxi-dress-24.jpg"
        },
        {
          "name": "Gown Maxi",
          "price": "\$79.99",
          "image": "https://www.6thstreetconcordia.com/wp-content/uploads/2019/09/84477F08-A378-440F-81B4-88D362EFEA45.jpeg"
        },
        {
          "name": "Striped Maxi",
          "price": "\$64.50",
          "image": "https://cdn2.shopify.com/s/files/1/0800/4863/products/Blush_Floral_Maxi_Dress_with_Pockets_1600x.jpg?v=1559758812"
        },
      ],
      'Ball Gown': [
        {
          "name": "Fairytale Princess",
          "price": "\$189.99",
          "image": "https://sandiegotowingca.com/wp-content/uploads/2019/04/evening-ball-gown-dresses-1.jpg"
        },
        {
          "name": "Lace Ball Gown",
          "price": "\$149.95",
          "image": "https://cdn.shopify.com/s/files/1/2102/5691/products/139_821ce2fa-a664-4272-a24a-9c852333f7dd_1024x1024@2x.jpg?v=1571609828"
        },
        {
          "name": " Dream Ball Gown",
          "price": "\$199.99",
          "image": "https://www.davidresses.com/images/thumbnails/prom-dresses/orange-ball-gown-strapless-bandage-floor-length-quinceanera-dresses-with-embroidery-and-twist-draped-prom01113.jpg"
        },
        {
          "name": "Satin Ball Gown",
          "price": "\$174.50",
          "image": "https://www.careyfashion.com/wp-content/uploads/2016/12/ball-gown-wedding-dresses-8.jpg"
        },
      ],
      'A-Line Dress': [
        {
          "name": "Timeless A-Line",
          "price": "\$49.99",
          "image": "https://image26.stylesimo.com/o_img/2017/11/22/246945-10488297/women-s-v-neck-half-sleeve-a-line-prom-dress.jpg"
        },
        {
          "name": "Floral A-Line ",
          "price": "\$59.95",
          "image": "https://www.modes.co.nz/wp-content/uploads/2020/03/Webp.net-resizeimage-4.jpg"
        },
        {
          "name": "Casual A-Line",
          "price": "\$69.99",
          "image": "https://i.pinimg.com/originals/00/56/6e/00566e164bd49ff2f332ea494736274d.jpg"
        },
        {
          "name": "Printed A-Line",
          "price": "\$54.50",
          "image": "https://i.pinimg.com/736x/b0/03/97/b00397079697bf5808987508def208ab.jpg"
        },
      ],
      'Empire Waist Dress': [
        {
          "name": "Grecian Goddess",
          "price": "\$59.99",
          "image": "https://www.gemgrace.com/25134-thickbox_default/empire-waist-sweetheart-long-formal-dress-backless.jpg"
        },
        {
          "name": "Lace Empire Waist",
          "price": "\$49.95",
          "image": "https://i.pinimg.com/originals/ef/6c/54/ef6c54e2939e1ea86279d761fdbb2219.jp"
        },
        {
          "name": "Modern Romantic",
          "price": "\$69.99",
          "image": "https://i.pinimg.com/originals/29/a7/bf/29a7bfbaacecff959d8948b87ad6cbff.jpg"
        },
        {
          "name": "Empire Waist",
          "price": "\$64.50",
          "image": "https://cdn.sheprom.com/7289-thickbox_default/empire-waist-navy-blue-lace-chiffon-formal-dress-long-sleeves.jpg"
        },
      ],
      'Kaftan Dress': [
        {
          "name": "Kaftan Maxi",
          "price": "\$44.99",
          "image": "https://i5.walmartimages.com/asr/ad44213f-0a26-4c9b-82a8-43594160a208_6.c75470216a7fef3350ab09fa16eb50fd.jpeg"
        },
        {
          "name": "Beach Kaftan",
          "price": "\$34.95",
          "image": "https://i.pinimg.com/originals/d5/4e/bb/d54ebbd91b6dd855bec85a9ff999b1ef.jpg"
        },
        {
          "name": "Ethnic Inspired",
          "price": "\$54.99",
          "image": "https://i5.walmartimages.com/asr/d6bd0f92-c1e7-49c5-89e8-c0b45043f2ce.87cd10fe2029c827efd4a49b7e1bbfde.jpeg"
        },
        {
          "name": "Relaxed Resort",
          "price": "\$49.50",
          "image": "https://i5.walmartimages.com/asr/abdfebd4-0f1d-4271-9c64-d078f82d72c0_5.412e6c1625a5eb0ce1c630742b259668.jpeg"
        },
      ],
      'Frocks': [
        {
          "name": "Wonderland Frock",
          "price": "\$39.99",
          "image": "https://stylearena.net/wp-content/uploads/2015/04/anarkali-frocks.jpg"
        },
        {
          "name": "Floral Frock",
          "price": "\$29.95",
          "image": "https://i.pinimg.com/originals/29/50/38/295038a0b25990afe296e33111242227.jpg"
        },
        {
          "name": "Playful Frock",
          "price": "\$49.99",
          "image": "https://i.pinimg.com/originals/a8/a7/7e/a8a77e8fae29893ef65f75081704cebc.png"
        },
        {
          "name": "Ruffle Frock",
          "price": "\$44.50",
          "image": "https://www.stylesnic.com/wp-content/uploads/2020/08/plain-long-frock-with-matching-shrug.jpg"
        },
      ],
      'Banarasi Saree': [
        {
          "name": "Silk Banarasi",
          "price": "\$199.99",
          "image": "https://cdn.sareeka.com/image/cache/data2018/banarasi-silk-traditional-saree-83465-1000x1375.jpg"
        },
        {
          "name": "Weave Banarasi",
          "price": "\$169.95",
          "image": "https://www.shaadidukaan.com/vogue/wp-content/uploads/2020/04/Banarasi-Sarees-29.jpg"
        },
        {
          "name": "Motif Banarasi",
          "price": "\$219.99",
          "image": "https://www.kollybollyethnics.com/image/catalog/data/14Nov2017/Yellow-pure-banarasi-silk-saree-wedding-1218.jpg"
        },
        {
          "name": "Blue Banarasi",
          "price": "\$184.50",
          "image": "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/w/swz233.jpg"
        },
      ],
      'Kanjivaram Saree': [
        {
          "name": "Border Kanjivaram",
          "price": "\$299.99",
          "image": "https://i.pinimg.com/originals/6a/c3/9e/6ac39e2f77ca72269402d5b013ebf4e1.jpg"
        },
        {
          "name": "Pallu Kanjivaram",
          "price": "\$259.95",
          "image": "https://getethnic.com/wp-content/uploads/2020/04/42hgga59ac81ae5d468cde655f28ad2bcfc54-1-564x1024.jpg"
        },
        {
          "name": "Red Kanjivaram",
          "price": "\$319.99",
          "image": "https://i.pinimg.com/originals/09/e0/ea/09e0ea69db405e054c82c56ebdf81a75.jpg"
        },
        {
          "name": "Motif Kanjivaram",
          "price": "\$284.50",
          "image": "https://webmerx.sgp1.cdn.digitaloceanspaces.com/theindianfab/product_images/1582018482.B-1564-Grey_(3).jpg"
        },
      ],
      'Dhakai Jamdani Saree': [
        {
          "name": "Artistic Floral ",
          "price": "\$149.99",
          "image": "https://cpimg.tistatic.com/04331969/b/4/extra-04331969.jpg"
        },
        {
          "name": "Pastel Delight",
          "price": "\$119.95",
          "image": "https://www.sajasajo.com/uploads/RKB3540_1.jpg"
        },
        {
          "name": "Gold Threadwork",
          "price": "\$169.99",
          "image": "https://n3.sdlcdn.com/imgs/a/s/e/Parichay-Dhakai-Jamdani-Saree-With-SDL726117861-1-6af5a.jpg"
        },
        {
          "name": "Vibrant Striped",
          "price": "\$134.50",
          "image": "https://i.pinimg.com/originals/16/66/42/16664227c52e94cd1f2635289985077c.jpg"
        },
      ],
      'Bandhani Saree': [
        {
          "name": "Rajasthani Bandhani",
          "price": "\$99.99",
          "image": "https://i.pinimg.com/originals/36/0b/e2/360be2f47807745e7e677dd3c97ff8ba.jpg"
        },
        {
          "name": "Bright Tie-Dye",
          "price": "\$79.95",
          "image": "https://static.jaypore.com/media/catalog/product/w/s/wstsaj50029254-1_1.jpg"
        },
        {
          "name": "Elegant Geometric",
          "price": "\$119.99",
          "image": "https://baggout.com/wp-content/uploads/2017/10/designer-fancy-gujarati-bandhani-saree-with-creeper-golden-gota-lace-e17021-ba0.jpg"
        },
        {
          "name": "Blue and White",
          "price": "\$94.50",
          "image": "https://i.pinimg.com/originals/c5/71/fc/c571fcaa87f70c41ba366f43157440ab.jpg"
        },
      ],
      'Chanderi Saree': [
        {
          "name": "Chanderi Silk",
          "price": "\$129.99",
          "image": "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-chanderi-silk-saree-in-peach-v1-ssf14434.jpg"
        },
        {
          "name": "Chanderi Cotton",
          "price": "\$99.95",
          "image": "https://media.weddingz.in/images/products/2015/10/IMG_9936.JPG"
        },
        {
          "name": "Print Chanderi",
          "price": "\$149.99",
          "image": "https://ik.imagekit.io/theloomdev/tr:c-at_max,w-1000,h-1333/catalog/product/1/5/15th_mar_2018_04346.jpg"
        },
        {
          "name": "Embroidery Chanderi",
          "price": "\$114.50",
          "image": "https://i.pinimg.com/originals/4e/9f/15/4e9f15f78f72b525684941d823b5625d.jpg"
        },
      ],
      'Tant Saree': [
        {
          "name": "Tant Cotton",
          "price": "\$89.99",
          "image": "https://www.utsavpedia.com/wp-content/uploads/2014/06/handloom-tant-cotton-saree-in-olive-green.jpg"
        },
        {
          "name": "Bengali Tant",
          "price": "\$69.95",
          "image": "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/h/a/handloom-cotton-tant-saree-in-peach-v1-shxa1659.jpg"
        },
        {
          "name": "Jamdani Weave ",
          "price": "\$109.99",
          "image": "https://cpimg.tistatic.com/05727961/b/4/extra-05727961.jpg"
        },
        {
          "name": "Classic Red",
          "price": "\$84.50",
          "image": "https://static.10kya.com/media/catalog/product/cache/1/image/1080x/b05d625d6b6a602168d46abb7a406194/a/-/a-p-10kya-77-sri116404o4_1.jpg"
        },
      ],
      'Button-Down Shirt': [
        {
          "name": "Classic White ",
          "price": "\$39.99",
          "image": "https://i5.walmartimages.com/asr/07566817-9636-45ff-9816-933e6337fa54_1.7b825b375d7ab52c7402291a79504b42.jpeg"
        },
        {
          "name": "Plaid Flannel",
          "price": "\$29.95",
          "image": "https://i5.walmartimages.com/asr/5cabb2d8-1a6f-4c3b-b890-b66987acd8bc_1.9e05b34c4de216fe33c82faa432dbbb8.jpeg"
        },
        {
          "name": "Casual Denim ",
          "price": "\$49.99",
          "image": "https://pa.namshicdn.com/product/A3/92486W/1-zoom-desktop.jpg"
        },
        {
          "name": "Striped Linen",
          "price": "\$44.50",
          "image": "https://i5.walmartimages.com/asr/3fbd8a4d-657a-4848-90f5-f67ff5f6fc41_1.e593d8cfac4d396bf68bd1919dda4879.jpeg"
        },
      ],
      'Polo Shirt': [
        {
          "name": "Pique Polo",
          "price": "\$24.99",
          "image": "https://i5.walmartimages.com/asr/7a878cca-7130-46ca-b4c5-3f2acc4a6a32_1.f580e558d7cb28bf5c20abb345568c9e.jpeg"
        },
        {
          "name": "Collar Polo",
          "price": "\$19.95",
          "image": "https://cdna.lystit.com/photos/b2b3-2015/04/16/polo-ralph-lauren-vibrant-purple-skinny-stretch-polo-shirt-purple-product-2-543425458-normal.jpeg"
        },
        {
          "name": "Golf Polo",
          "price": "\$29.99",
          "image": "https://cdnb.lystit.com/photos/e545-2014/09/30/burberry-brit-black-polo-shirt-product-1-20520842-0-925232270-normal.jpeg"
        },
        {
          "name": "Block Polo",
          "price": "\$34.50",
          "image": "https://cdn.shopify.com/s/files/1/0867/1796/products/05MF-48.jpg?v=1582814006"
        },
      ],
      'T-Shirt': [
        {
          "name": "Neck Tee",
          "price": "\$14.99",
          "image": "https://i5.walmartimages.com/asr/1b568581-99fc-4295-b9ad-ab57febbffc6_1.fce835a2ee5a9e5fc126711b1ef91377.jpeg"
        },
        {
          "name": "Graphic Print",
          "price": "\$19.95",
          "image": "https://i5.walmartimages.com/asr/0cedb951-81df-4a28-b039-f62bd76cc8b0_1.a6e29fba2cf28f7c3f4246e37af4bba8.jpeg"
        },
        {
          "name": "Casual Tee",
          "price": "\$24.99",
          "image": "https://i5.walmartimages.com/asr/aaa349f3-2bba-42a2-bcac-eb4f0c83f3c2.46d557cd61bbf76d82536dbb3281a725.jpeg"
        },
        {
          "name": " Washed T-Shirt",
          "price": "\$18.50",
          "image": "https://i5.walmartimages.com/asr/14297b85-c1c8-442a-9e67-c6943a413e13_1.f9ed6caa72e06acd9d3b04db27227cb6.jpeg"
        },
      ],
      'Henley Shirt': [
        {
          "name": "Long Sleeve Henley",
          "price": "\$29.99",
          "image": "https://i5.walmartimages.com/asr/53694cb2-45ea-4d41-b304-45b2b0d85b9f_3.8eac3b5507d0ee120a3c74895015dd0b.png"
        },
        {
          "name": "Button Placket Henley",
          "price": "\$24.95",
          "image": "https://i5.walmartimages.com/asr/c4a3dde1-e29e-45d1-89ba-7e35c6806dd6_3.23c28ee94787b8d794251fcfc262731a.png"
        },
        {
          "name": "Thermal Knit Henley",
          "price": "\$34.99",
          "image": "https://i.pinimg.com/originals/2a/44/c0/2a44c0c44b8feddd0e3e8914bd97b46d.jpg"
        },
        {
          "name": "Raglan Sleeve Henley",
          "price": "\$29.50",
          "image": "https://res.cloudinary.com/vandelay/T11759-WHT-2.jpg"
        },
      ],
      'Dress Shirt': [
        {
          "name": "Formal Shirt",
          "price": "\$49.99",
          "image": "https://media.missguided.com/i/missguided/YX9208454_01?fmt=jpeg"
        },
        {
          "name": "French Cuff Shirt",
          "price": "\$39.95",
          "image": "https://i5.walmartimages.com/asr/ce1daf7f-cdf3-4c15-9437-d9088372ba39.9a118361f9fa524d66975052eea39dfd.jpeg"
        },
        {
          "name": "Dress Shirt",
          "price": "\$59.99",
          "image": "https://i.pinimg.com/736x/1a/75/5c/1a755c97deb14406b50f814d88da605e--iron-dress-clothes.jpg"
        },
        {
          "name": " Business Shirt",
          "price": "\$54.50",
          "image": "https://handcmediastorage.blob.core.windows.net/productimages/FO/FOPMA001-A01-135478-800px-1040px.jpg"
        },
      ],
      'Flannel Shirt': [
        {
          "name": "Plaid Flannel",
          "price": "\$34.99",
          "image": "https://i5.walmartimages.com/asr/037fb01d-9917-4042-9c0b-d25b4ff9de5a_1.e9be29dc43c136b8c998e78dab98c768.jpeg"
        },
        {
          "name": "Checked Flannel",
          "price": "\$29.95",
          "image": "https://images.north40.com/images/1909211/BA_carhartt_womens_long_sleeve_rugged_flex_relaxed_fit_flannel_plaid_shirt_twilight__1909211__.jpg?width=900&height=900"
        },
        {
          "name": "Sherpa Flannel",
          "price": "\$39.99",
          "image": "https://i5.walmartimages.com/asr/a60de616-e347-43c9-a012-dbbae64d377c_1.bee487be52b02c1dc0fa603cdcee796d.jpeg"
        },
        {
          "name": "Quilted Flannel",
          "price": "\$44.50",
          "image": "https://i.pinimg.com/originals/b3/07/0e/b3070e999f6bac1b082a9dbaa1fcf396.jpg"
        },
      ],
      'Jeans': [
        {
          "name": " Skinny Jeans",
          "price": "\$49.99",
          "image": "https://image26.stylesimo.com/o_img/2018/08/14/256768-10563718/casual-stretch-faded-ripped-slim-fit-skinny-denim-jeans.jpg"
        },
        {
          "name": " Boyfriend Jeans",
          "price": "\$39.95",
          "image": "https://i5.walmartimages.com/asr/4d351924-3a01-47b0-8eee-1395cc481a47_3.86cb0dc7217fca54936e4894104c5dd8.jpeg"
        },
        {
          "name": "Flare Jeans",
          "price": "\$59.99",
          "image": "https://i5.walmartimages.com/asr/847defd3-bbdc-4315-9daf-e309b7debbc0.c1b1ea7bff7e21ccd471aad026a84d7c.jpeg"
        },
        {
          "name": " Wash Jeans",
          "price": "\$54.50",
          "image": "https://i.pinimg.com/originals/fc/15/98/fc15984bdacd92bf449f972f398bc742.jpg"
        },
      ],
      'Chinos': [
        {
          "name": " Khaki Chinos",
          "price": "\$34.99",
          "image": "https://image1.superdry.com/static/images/optimised/zoom/upload9223368955665765492.jpg"
        },
        {
          "name": " Beige Chinos",
          "price": "\$29.95",
          "image": "https://content.woolovers.com/img/o/43064_w23l_khaki_w_7.jpg"
        },
        {
          "name": "Green Chinos",
          "price": "\$39.99",
          "image": "https://i5.walmartimages.com/asr/062313bb-ff89-4b30-83b5-05bb285ad280.f45b8c23597889a2ca13f9cdee9ab450.jpeg"
        },
        {
          "name": "Blue Chinos",
          "price": "\$44.50",
          "image": "https://image1.superdry.com/static/images/optimised/zoom/upload9223368955665794073.jpg"
        },
      ],
      'Leggings': [
        {
          "name": " Black Leggings",
          "price": "\$24.99",
          "image": "https://i5.walmartimages.com/asr/c1d9d8a3-7bed-4542-b242-90765ba1487b.d7ed4e6130dca60913dfbe4a0779c645.jpeg"
        },
        {
          "name": "Athletic Leggings",
          "price": "\$19.95",
          "image": "https://i5.walmartimages.com/asr/6c220b64-d372-4fe7-bae0-eb32b6a2cd69_1.9f1e3131fae5800cc76d2d62e1d65015.jpeg"
        },
        {
          "name": "Yoga Leggings",
          "price": "\$29.99",
          "image": "https://sc01.alicdn.com/kf/Hb6f39e541473449d8ecb4a2bb2af7b7aL/228993011/Hb6f39e541473449d8ecb4a2bb2af7b7aL.jpg"
        },
        {
          "name": "Compression Leggings",
          "price": "\$34.50",
          "image": "https://cdna.lystit.com/photos/zappos/8773167-Surplus-cab58e26-.jpeg"
        },
      ],
      'Palazzo Pants': [
        {
          "name": "Wide-Leg Palazzo",
          "price": "\$29.99",
          "image": "https://i.pinimg.com/originals/73/75/27/7375272c5d5f33d2b37093bb17c76117.jpg"
        },
        {
          "name": " Flowy Palazzo",
          "price": "\$24.95",
          "image": "https://s3-eu-west-1.amazonaws.com/images.linnlive.com/fd6c4c1fc0c305a6e41fb6c823555ada/e2d559cc-3235-4bad-9f71-341192939b1b.jpg"
        },
        {
          "name": " Pleated Palazzo",
          "price": "\$34.99",
          "image": "https://gloimg.rglcdn.com/rosegal/pdm-product-pic/Clothing/2017/04/21/source-img/20170421162659_77004.jpg"
        },
        {
          "name": " Culotte Palazzo",
          "price": "\$29.50",
          "image": "https://i.pinimg.com/originals/8f/17/13/8f1713c49e7058329af6c0033dd2f1cd.jpg"
        },
      ],
      'Cargo Pants': [
        {
          "name": "Camo Cargo",
          "price": "\$39.99",
          "image": "https://i5.walmartimages.com/asr/4dd13830-527e-4463-85e0-24d5ec2f1a83.7c721a55f6c891c5b3c0b0509831cee8.jpeg"
        },
        {
          "name": " Cargo Joggers",
          "price": "\$34.95",
          "image": "https://storefeederimages.blob.core.windows.net/glamouroutfitters/Products/f08d4b69-c468-43f1-aceb-89e25b8684da/Full/2v5j3najcle.Jpeg"
        },
        {
          "name": "Khaki Pants",
          "price": "\$44.99",
          "image": "https://i.pinimg.com/736x/7c/8f/20/7c8f20d9c703b27f138681eb3539e27a.jpg"
        },
        {
          "name": "Cargo Jeans",
          "price": "\$39.50",
          "image": "https://www.skylinewears.com/wp-content/uploads/2019/01/5.jpg"
        },
      ],

      'Culottes': [
        {
          "name": "Pleated Culottes",
          "price": "\$34.99",
          "image": "https://www.shopolics.com/uploads/images/full/Blue-Cotton-Solid-Women-culottes-33326_3.jpg"
        },
        {
          "name": "Wide-Leg Culottes",
          "price": "\$29.95",
          "image": "https://cdn.yoursclothing.com/Images/ProductImages/Navy_Double_Pleated_Culottes_171633_2395.jpg"
        },
        {
          "name": "Denim Culottes",
          "price": "\$39.99",
          "image": "https://cdnc.lystit.com/photos/c29f-2014/06/05/topshop-white-womens-textured-snakeskin-culottes-white-product-1-20596698-4-792800775-normal.jpeg"
        },
        {
          "name": "Linen Culottes",
          "price": "\$34.50",
          "image": "https://assets.myntassets.com/h_200,w_200,c_fill,g_auto/h_1440,q_100,w_1080/v1/assets/images/productimage/2020/11/13/eb5c33cb-b158-45ec-812d-1a538b903a3b1605237276138-1.jpg"
        },
      ],
      'A-line Skirt': [
        {
          "name": "Floral PrintSkirt",
          "price": "\$29.99",
          "image": "https://i.etsystatic.com/5609612/r/il/95e6a7/2903902698/il_1588xN.2903902698_qz84.jpg"
        },
        {
          "name": "Denim Skirt",
          "price": "\$24.95",
          "image": "https://i5.walmartimages.com/asr/53d1f69a-1c07-445f-8b01-e43305b2e713.09b74ee19e95570d0cddd20e54294a7d.jpeg"
        },
        {
          "name": "Midi A-line Skirt",
          "price": "\$34.99",
          "image": "https://i.etsystatic.com/5609612/r/il/22364e/2654086981/il_794xN.2654086981_o7a4.jpg"
        },
        {
          "name": "Skater Skirt",
          "price": "\$29.50",
          "image": "https://www.countrycollection.co.uk/imageserver/prodimg/wcf/1200/1500/4SA%20IN_1_Zoom.jpg"
        },
      ],
      'Pencil Skirt': [
        {
          "name": "High-Waisted Skirt",
          "price": "\$34.99",
          "image": "https://stylecheer.com/wp-content/uploads/2021/08/Fashionable-brunette-wearing-turtle-neck-and-black-pencil-skirt.jpg"
        },
        {
          "name": "Striped Skirt",
          "price": "\$29.95",
          "image": "https://cdnb.lystit.com/photos/4bc0-2015/07/22/vince-bordeaux-leather-pencil-skirt-purple-product-0-680885240-normal.jpeg"
        },
        {
          "name": "Leather Skirt",
          "price": "\$39.99",
          "image": "https://i.etsystatic.com/6680146/r/il/155053/2032832157/il_fullxfull.2032832157_neqq.jpg"
        },
        {
          "name": "Printed Skirt",
          "price": "\$34.50",
          "image": "https://cdnc.lystit.com/photos/20b2-2015/08/19/milly-black-fitted-pencil-skirt-product-3-855890884-normal.jpeg"
        },
      ],
      'Maxi Skirt': [
        {
          "name": "Bohemian Floral",
          "price": "\$39.99",
          "image": "https://www.stylewile.com/wp-content/uploads/2017/03/How-to-Wear-Pleated-Maxi-Skirt.jpg"
        },
        {
          "name": "Tiered Ruffle",
          "price": "\$34.95",
          "image": "https://www.dressedupgirl.com/wp-content/uploads/2015/11/Long-Black-Pleated-Maxi-Skirt.jpg"
        },
        {
          "name": "Wrap Front",
          "price": "\$44.99",
          "image": "https://www.allseams.com/wp-content/uploads/2019/04/linen-maxi-skirt-4--scaled.jpg"
        },
        {
          "name": "Pleated Chiffon",
          "price": "\$39.50",
          "image": "https://www.boutiqna.com/wp-content/uploads/2019/09/0N5A5255.jpg"
        },
      ],
      'Wrap Skirt': [
        {
          "name": "Wrap Front",
          "price": "\$29.99",
          "image": "https://i.etsystatic.com/5609612/r/il/be81a4/577987807/il_fullxfull.577987807_t243.jpg"
        },
        {
          "name": "Tie-Dye Wrap ",
          "price": "\$24.95",
          "image": "https://i5.walmartimages.com/asr/ba7a0f55-81ad-40fa-b665-ad1908d040a6.94135f3f2741f70915b2385f3c21c987.jpeg"
        },
        {
          "name": "Faux Leather ",
          "price": "\$34.99",
          "image": "https://i1.adis.ws/i/boohooamplience/ayy07032_black_xl?w=1500"
        },
        {
          "name": "Printed Wrap",
          "price": "\$29.50",
          "image": "https://i5.walmartimages.com/asr/afdb54b3-1e74-432d-876c-039dc207b2c7_1.1f0451581f9f18fa08dab2baddb7ff55.jpeg"
        },
      ],
      'Pleated Skirt': [
        {
          "name": "Accordion Pleat ",
          "price": "\$34.99",
          "image": "https://image26.stylesimo.com/o_img/2017/11/14/245862-10479449/women-s-high-waist-maxi-chiffon-pleated-skirt.jpg"
        },
        {
          "name": "Metallic Pleated",
          "price": "\$29.95",
          "image": "https://img.shein.com/images/shein.com/201609/35/14738509398561574273.jpg"
        },
        {
          "name": "Knife Pleat",
          "price": "\$39.99",
          "image": "https://images.bonanzastatic.com/afu/images/92e1/34ad/4919_7698656461/4442.3.2.jpg"
        },
        {
          "name": "Plaid Pleated A-line Skirt",
          "price": "\$34.50",
          "image": "https://i.pinimg.com/originals/de/87/1e/de871e41c2cc05ca7651dfd4a5185578.jpg"
        },
      ],
      'Midi Skirt': [
        {
          "name": "High-Waisted Midi ",
          "price": "\$29.99",
          "image": "https://media.missguided.com/s/missguided/S10001895_set/1/black-button-front-midi-skirt.jpg"
        },
        {
          "name": "Floral Print Midi",
          "price": "\$24.95",
          "image": "https://cdn-img.prettylittlething.com/2/9/d/0/29d0fc1662cfe5b00dace1e2805bfad5e3fd97ed_CML3129_4.jpg"
        },
        {
          "name": "A-line Skirt",
          "price": "\$34.99",
          "image": "https://cdn.cliqueinc.com/posts/287934/summer-midi-skirts-287934-1623935454655-main.1080x0c.jpg?interlace=true&quality=70"
        },
        {
          "name": "Pleated Midi",
          "price": "\$29.50",
          "image": "https://i5.walmartimages.com/asr/b661e520-8ef0-4ff7-ba5e-bcf2c9e15cdf.62065d5b5b045da7b74a3c75e5da5d8e.jpeg"
        },
      ],
      'Foundation': [
        {
          "name": "Liquid Dewy",
          "price": "\$29.99",
          "image": "https://www.hiboox.com/wp-content/uploads/2020/02/make-up.jpg"
        },
        {
          "name": "Matte Full",
          "price": "\$24.95",
          "image": "https://media.allure.com/photos/5a78d12a7d7fdc5309bc883c/1:1/w_1600/maybelline-foundation-swatches.jpg"
        },
        {
          "name": "Mineral Powder ",
          "price": "\$34.99",
          "image": "https://bpc.h-cdn.co/assets/16/50/1481733032-liquid-foundation.jpg"
        },
        {
          "name": "Tinted Moist",
          "price": "\$29.50",
          "image": "https://sc01.alicdn.com/kf/H924821cfe97e4d4899cfa5fa53ab9a33H.jpg"
        },
      ],
      'Lipstick': [
        {
          "name": "Red Matte",
          "price": "\$14.99",
          "image": "https://img.makeupalley.com/1/1/8/1/3574012.JPG"
        },
        {
          "name": "Nude Satin Finish",
          "price": "\$19.95",
          "image": "https://cdn.cliqueinc.com/posts/288977/mac-red-lipsticks-288977-1599124642688-product.1200x0c.jpg?interlace=true&quality=70"
        },
        {
          "name": "Long Liquid",
          "price": "\$24.99",
          "image": "https://s1.thcdn.com/productimg/0/960/960/13/10999813-1413994100-847021.jpg"
        },
        {
          "name": "Sheer Glossy",
          "price": "\$18.50",
          "image": "https://cdn.shopify.com/s/files/1/1154/3546/products/loreal-privee-collection-color-riche-lipstick-jlos-nude-645-5ml-p20795-9..._800x.jpg?v=1544006312"
        },
      ],
      'Eyeshadow': [
        {
          "name": "Neutral Tone ",
          "price": "\$34.99",
          "image": "https://www.maccosmetics.com/media/export/cms/products/640x600/mac_sku_MXG701_640x600_0.jpg"
        },
        {
          "name": "Smoky Eye ",
          "price": "\$29.95",
          "image": "https://dy6g3i6a1660s.cloudfront.net/jVQVikjAT6jqZf7aGDjzxAR-BH4/zb_p.jpg"
        },
        {
          "name": "Colorful Matte",
          "price": "\$39.99",
          "image": "https://media1.popsugar-assets.com/files/thumbor/QgQJr9okcVIEFPT0aJn07Epjh2I/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2015/11/25/725/n/1922153/da065383_download-69/i/Eye-Shadow"
        },
        {
          "name": "Creamy Metallic ",
          "price": "\$34.50",
          "image": "https://cdn.cliqueinc.com/posts/286103/best-eye-shadow-products-286103-1584050475271-product.750x0c.jpg?interlace=true&quality=70"
        },
      ],
      'Mascara': [
        {
          "name": "Volumizing Black",
          "price": "\$19.99",
          "image": "https://www.sensiblestylista.com/wp-content/uploads/2021/05/best-mascara-1440x1440.jpg"
        },
        {
          "name": "Lengthening Mascara",
          "price": "\$16.95",
          "image": "https://pngimg.com/uploads/mascara/mascara_PNG81.png"
        },
        {
          "name": "Lash Serum",
          "price": "\$24.99",
          "image": "https://cdn.kicks.se/globalassets/integrationimages/3348900669710.jpg?ref=667776&hasAlpha=false"
        },
        {
          "name": "Dramatic Mascara",
          "price": "\$22.50",
          "image": "https://pngimg.com/uploads/mascara/mascara_PNG116.png"
        },
      ],
      'Blush': [
        {
          "name": "Powder Blush",
          "price": "\$16.99",
          "image": "https://img.makeupalley.com/1/1/8/1/3488911.JPG"
        },
        {
          "name": "Peachy Cream ",
          "price": "\$14.95",
          "image": "https://img.makeupalley.com/1/1/8/1/3362636.JPG"
        },
        {
          "name": "Matte Coral",
          "price": "\$18.99",
          "image": "https://media1.popsugar-assets.com/files/thumbor/a8q5p83X2nNCGFkGW5Qp3pUatu0/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2017/07/21/748/n/1922153/a9a6cd3faa05cb8b_artistfacecolor_b208_mono_open/i/Blush.jpg"
        },
        {
          "name": "Shimmering Rose",
          "price": "\$16.50",
          "image": "https://img.makeupalley.com/1/1/8/1/3589572.jpg"
        },
      ],
      'Eyeliner': [
        {
          "name": "Jet Black Liquid",
          "price": "\$12.99",
          "image": "https://i5.walmartimages.com/asr/72984064-a515-4d0f-8746-803fbaa6f8ed.ff3842fafc5ab8c4fe45c01bfafd72f8.jpeg"
        },
        {
          "name": "Smudge-Proof Gel",
          "price": "\$14.95",
          "image": "https://www.elfcosmetics.com/dw/image/v2/BBXC_PRD/on/demandware.static/-/Sites-elf-master/default/dw8f077a88/81206_900px_100011.jpg?sw=1100&sh=1100&sm=fit&sfrm=jpg"
        },
        {
          "name": "Precision Brown",
          "price": "\$16.99",
          "image": "https://de927adv5b23k.cloudfront.net/wp-content/uploads/2018/06/29184948/shutterstock_144000931-800x800.jpg"
        },
        {
          "name": "Dual-Ended Winged",
          "price": "\$15.50",
          "image": "https://www.kismetcosmetics.com/wp-content/uploads/2019/02/eyelinerhero-scaled.jpg"
        },
      ],
      'Earrings': [
        {
          "name": "Hoop Earrings",
          "price": "\$19.99",
          "image": "https://cdn.shopify.com/s/files/1/2715/1950/products/il_fullxfull.1318488762_c6ie_5000x.jpg?v=1569168401"
        },
        {
          "name": "Stud Earrings",
          "price": "\$14.95",
          "image": "https://45c753781809faaa6061-7667b133b6c9b9fa750a06f1c60138be.ssl.cf2.rackcdn.com/product-original-388401-3876-1414820957-c2b93bfa68af0a7000d98e1413241f42.414820958_type_original_nid_388401_uid_3876_1"
        },
        {
          "name": "Statement Drop",
          "price": "\$24.99",
          "image": "https://i.etsystatic.com/28259184/r/il/cd46ad/2941279814/il_1588xN.2941279814_cqh6.jpg"
        },
        {
          "name": "Chandelier Earrings",
          "price": "\$22.50",
          "image": "https://ma.heyhappiness.com/37908-quark_thickbox/delicate-stacking-stud-earrings-set-sterling-silver-gold.jpg"
        },
      ],
      'Necklaces': [
        {
          "name": "Layered Pendant",
          "price": "\$29.99",
          "image": "https://i.etsystatic.com/6027990/r/il/e90620/421649366/il_fullxfull.421649366_cz3s.jpg"
        },
        {
          "name": "Choker Necklace",
          "price": "\$24.95",
          "image": "https://images-na.ssl-images-amazon.com/images/I/61hf-GXiofL._SL1000_.jpg"
        },
        {
          "name": "Long Boho Beaded",
          "price": "\$34.99",
          "image": "https://i.etsystatic.com/12828076/r/il/15f2c2/2229787923/il_fullxfull.2229787923_nzch.jpg"
        },
        {
          "name": "Personalized Name",
          "price": "\$29.50",
          "image": "https://n4.sdlcdn.com/imgs/f/3/q/Sukkhi-Traditional-Gold-Plated-Kundan-SDL494397596-2-8beca.jpg"
        },
      ],
      'Bracelets': [
        {
          "name": "Cuff Bracelet",
          "price": "\$16.99",
          "image": "https://marcolauren.r.worldssl.net/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/p/h/photo_aug_30_4_28_11_pm_1_5.jpg"
        },
        {
          "name": "Beaded Charm Bracelet",
          "price": "\$14.95",
          "image": "https://www.uniquebracelet.co.uk/wp-content/uploads/2020/10/IMG_0587_2.jpg"
        },
        {
          "name": "Leather Wrap Bracelet",
          "price": "\$18.99",
          "image": "https://img.alicdn.com/imgextra/i2/6000000004302/O1CN01QWrqV21heMMVSZRSW_!!6000000004302-0-tbvideo.jpg"
        },
        {
          "name": "Chain Link Bracelet",
          "price": "\$16.50",
          "image": "https://cdn.notonthehighstreet.com/fs/ab/aa/b8ff-e8f1-4fcf-b5a1-188c281f92df/original_delicate-gold-bracelet.jpg"
        },
      ],
      'Scarves': [
        {
          "name": "Cashmere Wool",
          "price": "\$34.99",
          "image": "https://i5.walmartimages.com/asr/c7ca0622-a96d-4a96-b06c-770f3758d67a_1.cd6e0096262a6f19e31b8d6dfab437fe.jpeg"
        },
        {
          "name": "Printed Silk",
          "price": "\$29.95",
          "image": "https://i5.walmartimages.com/asr/87f8c985-04da-481a-9722-5759a1e81c9e.32052bc38eaad223e01781415b6b203d.jpeg"
        },
        {
          "name": "Infinity Loop",
          "price": "\$39.99",
          "image": "https://i5.walmartimages.com/asr/2c8e3f94-e8c4-4e65-b9cb-b79f9cb876ff_1.e7d0b52d2afb204eb3cc4aba59d2cb1d.jpeg"
        },
        {
          "name": "Chunky Knit",
          "price": "\$34.50",
          "image": "https://i5.walmartimages.com/asr/61f406b9-098f-40e0-b6ee-7d02de0b1387.bb703fad67ca4a043085f93036f141f6.jpeg"
        },
      ],
      'Sunglasses': [
        {
          "name": "Classic Aviator",
          "price": "\$24.99",
          "image": "https://i5.walmartimages.com/asr/723f1637-1b63-4dcb-a3dd-9f59d6d5ffe1_1.e7d86af054dc4f3e8753cc5f57be7c48.jpeg"
        },
        {
          "name": "Cat-Eye Frame",
          "price": "\$19.95",
          "image": "https://i5.walmartimages.com/asr/291dcd92-caae-4a1b-b0f0-a1cccd17ecc6_1.c89af4e6cb44f07955eba66c808f9547.jpeg"
        },
        {
          "name": "Oversized Squares",
          "price": "\$29.99",
          "image": "https://cdna.lystit.com/photos/5675-2013/12/15/prada-black-square-aviator-sunglasses-product-1-16145919-1-327777163-normal.jpeg"
        },
        {
          "name": "Round Retros",
          "price": "\$24.50",
          "image": "https://cdnb.lystit.com/photos/2013/04/22/tom-ford-rhodium-marko-aviator-sunglasses-product-1-8090316-439390746.jpeg"
        },
      ],
      'Hats': [
        {
          "name": "Fedora Hat",
          "price": "\$29.99",
          "image": "https://images-na.ssl-images-amazon.com/images/I/81A9H2muWyL.jpg"
        },
        {
          "name": "Wide Brim Hat",
          "price": "\$24.95",
          "image": "https://www.headcovers.com/media/catalog/product/cache/ba642c93a0efc71830935b1d4e0de39d/s/t/striped-wool-kettle-brim-womens-winter-hat-taupe-2.jpg"
        },
        {
          "name": "Beanie ",
          "price": "\$34.99",
          "image": "https://img.joomcdn.net/06a4c9718ea87f7937c855a8f495450f218721ca_original.jpeg"
        },
        {
          "name": "Bucket Hat",
          "price": "\$29.50",
          "image": "https://i5.walmartimages.com/asr/07a7d629-f5b9-49a3-ac3d-4f6fc03d65b8_1.f554c8ed4fbe7e24092fde2068a430dd.jpeg"
        },
      ],

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
                itemCount: categoryData[category]!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 400,
                ),
                itemBuilder: (context, index) {
    String itemName = categoryData[category]![index]["name"];
    String itemPrice = categoryData[category]![index]["price"];
    String itemImage = categoryData[category]![index]["image"];


    // Navigate to ItemDetails page with the selected item details
    return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemDetails(
            title: itemName, product: categoryData[category]![index], // Set your desired title
          ),
        ),
      );
    },
    child: Container(
    width: double.infinity,
    color: backgroundColor,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.network(
    itemImage,
    height: 240,
    width: double.infinity,
    fit: BoxFit.cover,
    ),
    ),
    16.heightBox,
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    itemName.text.fontFamily(semibold).color(
    darkFontGrey).size(18).make(),
    8.heightBox,
    "$itemPrice".text.color(redColor).fontFamily(
    bold).size(16).make(),
    ],
    ),
    ),
    ],
    ),
    ).box
        .white
        .margin(const EdgeInsets.symmetric(horizontal: 8))
        .roundedSM
        .outerShadowSm
        .padding(const EdgeInsets.all(16))
        .make(),
    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}