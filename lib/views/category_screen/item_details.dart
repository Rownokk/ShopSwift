import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mediumPeachyPinkColor,
      appBar: AppBar(
        title: title!
            .text
            .color(darkFontGrey)
            .fontFamily(bold)
            .make(),
        actions: [
          IconButton(
            onPressed: () {
              // Implement share functionality
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              // Implement favorite functionality
            },
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item details with background color
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.blue, // Change this to your desired background color
              child: Center(
                child: Text(
                  'No Image', // You can add a text or any other widget here
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white, // Adjust text color as needed
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Item details
            Text(
              'Item Name: ${title ?? "N/A"}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: darkFontGrey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Item Price: \$12',
              style: TextStyle(
                fontSize: 16,
                color: darkFontGrey,
              ),
            ),
            const SizedBox(height: 16),
            // Item description
            Text(
              'Item Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et urna nec lacus tincidunt fringilla.',
              style: TextStyle(
                fontSize: 16,
                color: darkFontGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

