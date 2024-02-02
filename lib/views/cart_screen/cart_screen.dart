import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/strings.dart';
import 'package:emart_app/views/category_screen/category_screen.dart';
//import 'package:emart_app/views/payment_screen/payment_screen.dart'; // Import the payment screen/page
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
                // Navigate to the payment screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
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

// payment_screen.dart


class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      backgroundColor: Colors.pinkAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose a Payment Method:',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement PayPal payment logic here
                handlePayment(context, 'PayPal');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://images.creativemarket.com/0.1.0/ps/3763165/1820/1466/m1/fpnw/wm1/mtgy1denzgfzalhgrid4iy5x4renf7tkhif3ubjzqkmclmvz5vo1gavoyxqht5tp-.jpg?1513841434&s=01514747aae43172b41e61b357ccbbbe', height: 30, width: 30),
                  SizedBox(width: 10),
                  Text('Pay with PayPal'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement Debit Card payment logic here
                handlePayment(context, 'Debit Card');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://images.creativemarket.com/0.1.0/ps/3763165/1820/1466/m1/fpnw/wm1/mtgy1denzgfzalhgrid4iy5x4renf7tkhif3ubjzqkmclmvz5vo1gavoyxqht5tp-.jpg?1513841434&s=01514747aae43172b41e61b357ccbbbe', height: 30, width: 30),
                  SizedBox(width: 10),
                  Text('Pay with Debit Card'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement Credit Card payment logic here
                handlePayment(context, 'Credit Card');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://images.creativemarket.com/0.1.0/ps/3763165/1820/1466/m1/fpnw/wm1/mtgy1denzgfzalhgrid4iy5x4renf7tkhif3ubjzqkmclmvz5vo1gavoyxqht5tp-.jpg?1513841434&s=01514747aae43172b41e61b357ccbbbe', height: 30, width: 30),
                  SizedBox(width: 10),
                  Text('Pay with Credit Card'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement Cash on Delivery payment logic here
                handlePayment(context, 'Cash on Delivery');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://images.creativemarket.com/0.1.0/ps/3763165/1820/1466/m1/fpnw/wm1/mtgy1denzgfzalhgrid4iy5x4renf7tkhif3ubjzqkmclmvz5vo1gavoyxqht5tp-.jpg?1513841434&s=01514747aae43172b41e61b357ccbbbe', height: 30, width: 30),
                  SizedBox(width: 10),
                  Text('Cash on Delivery'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handlePayment(BuildContext context, String paymentMethod) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Result'),
          content: Text('Payment successful with $paymentMethod!'), // You can customize this message
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
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








