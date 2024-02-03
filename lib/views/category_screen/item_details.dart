import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:emart_app/views/cart_screen//cart_screen.dart';

class ItemDetails extends StatefulWidget {
  final String? title;
  final Map<String, dynamic> product;
  const ItemDetails({Key? key,required this.product, required this.title}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: widget.title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: darkFontGrey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outlined,
              color: darkFontGrey,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ... existing code
               "${widget.product["price"]}".text.size(18).color(darkFontGrey).make(),



                    // Quantity selection
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Quantity:".text.color(Colors.black).make(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            quantity.toString().text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    // Star rating
                    Row(
                      children: [
                        "Rating:".text.color(Colors.black).make(),
                        VxRating(
                          onRatingUpdate: (value) {
                            // Handle rating update
                          },
                          normalColor: textfieldGrey,
                          selectionColor: golden,
                          count: 5,
                          size: 25,
                          stepInt: true,
                        ),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    // Additional details
                    ExpansionTile(
                      title: Text(
                        "Product Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      children: [
                        // Implement additional product details here
                        // Example: Product specifications, dimensions, etc.
                      ],
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ourButton(
                        color: redColor,
                        onPress: () {
                          // Handle adding item to the cart
                          // For demonstration, let's navigate to CartScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartScreen()),
                          );
                        },
                        textColor: whiteColor,
                        title: "Add to cart",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
