import 'package:emart_app/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'consts/consts.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final notificationHandler = NotificationHandler();
  await notificationHandler.init();
  runApp(const MyApp());
}

class NotificationHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    final String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground notifications
      print("Received foreground message: ${message.notification?.title}");

      // Display local notification when a message is received in the foreground
      _showLocalNotification(
        message.notification?.title,
        message.notification?.body,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("Message opened from background: ${message.notification?.title}");

      // Show notification dialog
      await _showNotificationDialog(
        Get.overlayContext!,
        title: message.notification?.title,
        body: message.notification?.body,
      );
    });

    // Configure local notifications
    await _configureLocalNotifications();
  }

  Future<void> _configureLocalNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: androidInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> _showLocalNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id', // Change this to a unique channel ID
      'Your Channel Name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0, // Change this to a unique notification ID
      title ?? 'Notification',
      body ?? 'Notification Body',
      platformChannelSpecifics,
      payload: 'Custom_Sound', // You can provide additional data here
    );
  }

  Future<void> _showNotificationDialog(
      BuildContext context, {
        String? title,
        String? body,
      }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title ?? 'Notification'),
        content: Text(body ?? 'Notification Body'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // User clicked 'Yes'
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // User clicked 'No'
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
      ),
      home: SplashScreen(),
    );
  }
}

class YourHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: Text('Welcome to your app!'),
      ),
    );
  }
}

class NotificationDialog extends StatelessWidget {
  final String? title;
  final String? body;

  NotificationDialog({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? 'Notification'),
      content: Text(body ?? 'Notification Body'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // User clicked 'Yes'
          },
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // User clicked 'No'
          },
          child: Text('No'),
        ),
      ],
    );
  }
}
