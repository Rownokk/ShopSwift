// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/views/home_screen/home.dart';
import '../../consts/colors.dart';
import '../../consts/consts.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id',
      'Your channel name',
      //'Your channel description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  Widget signupRulesWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Rules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '1. You must be at least 18 years old to create an account.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '2. Provide accurate and truthful information during the registration process.',
                style: TextStyle(fontSize: 16),
              ),
              // Add more rules as needed
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Sign up $appname".text
                  .fontFamily(bold)
                  .white
                  .size(18)
                  .make(),
              15.heightBox,
              Obx(
                    () => Column(
                  children: [
                    customTextField(
                        hint: nameHint,
                        title: name,
                        controller: nameController,
                        isPass: false),
                    customTextField(
                        hint: emailHint,
                        title: email,
                        controller: emailController,
                        isPass: false),
                    customTextField(
                        hint: passwordHint,
                        title: password,
                        controller: passwordController,
                        isPass: true),
                    customTextField(
                        hint: passwordHint,
                        title: retypePassword,
                        controller: passwordRetypeController,
                        isPass: true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: forgetPass.text.color(redColor).make(),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: redColor,
                          checkColor: whiteColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          },
                        ),
                        10.widthBox,
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // Show signup rules within the SignupScreen
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => signupRulesWidget(),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I Agree To The ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "&",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    5.heightBox,
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                        : ourButton(
                      color: isCheck == true ? redColor : lightGrey,
                      title: signup,
                      textColor: whiteColor,
                      onPress: () async {
                        if (nameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            passwordRetypeController.text.isEmpty) {
                          // Show notification for empty fields
                          showNotification(
                              "Error", "All fields are required.");
                          return;
                        }

                        if (isCheck != false) {
                          controller.isloading(true);
                          try {
                            await controller
                                .signupMethod(
                                context: context,
                                email: emailController.text,
                                password: passwordController.text)
                                .then((value) {
                              return controller.storeUserData(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              );
                            }).then((value) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(() => Home());
                              // Show success notification
                              showNotification(
                                  "Success", "Sign up successful!");
                            });
                          } catch (e) {
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                            controller.isloading(false);
                            // Show error notification
                            showNotification("Error", e.toString());
                          }
                        }
                      },
                    )
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        alreadyHaveAccount.text.color(fontGrey).make(),
                        5.widthBox,
                        login.text.color(redColor).make().onTap(() {
                          Get.back();
                        }),
                      ],
                    ),
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


