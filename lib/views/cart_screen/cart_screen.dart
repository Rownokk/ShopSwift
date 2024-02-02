import 'package:emart_app/consts/strings.dart';
import 'package:emart_app/views/category_screen/category_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Your Cart is Empty',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the category screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              },
              child: Text('Add To Your Cart'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality for the Payment button
                // This could include navigating to the payment screen or implementing payment logic.
                // For now, it just shows a snackbar.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Proceed to Payment'),
                  ),
                );
              },
              child: Text('Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: CartScreen(),
    ),
  );
}








