import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
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
            // Item image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/b7/a6/12/b7a612ab5d54dc9a655ad4ab93acb85e.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
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
