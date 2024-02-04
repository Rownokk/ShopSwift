import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/services/firebase_services.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_card.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  EditProfileScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Edit Profile Screen'),
            Text('Name: ${data["name"]}'),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs.isNotEmpty ? snapshot.data!.docs[0].data() as Map<String, dynamic> : {};

              return SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.nameController.text = data['name'] ?? '';
                          controller.passController.text = data['password'] ?? '';
                          Get.to(() => EditProfileScreen(data: data.cast<String, dynamic>()));
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit, color: redColor),
                        ),
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          data['imageUrl'] == null || data['imageUrl'] == ""
                              ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make()
                              : Image.network(data['imageUrl'], width: 100, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data["name"]}".text.semiBold.color(Colors.pinkAccent).make(),
                                "${data['email']}".text.color(Colors.pinkAccent).make(),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: redColor,
                              ),
                            ),
                            onPressed: () {
                              Get.put(AuthController()).signoutMethod(context);
                              Get.offAll(() =>  LoginScreen());
                            },
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontWeight: FontWeight.bold,
                                color: redColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(
                              count: data['card_count']?.toString() ?? "0", title: "in your cart", width: context.screenWidth / 3.4),
                          detailsCard(
                              count: data['wishlist_count']?.toString() ?? "0", title: "in your wishlist", width: context.screenWidth / 3.4),
                          detailsCard(
                              count: data['order_count']?.toString() ?? "0", title: "your orders", width: context.screenWidth / 3.4),
                        ],
                      ),
                      40.heightBox,
                      // ListView for profileButtonList
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Divider(color: lightGrey);
                        },
                        itemCount: profileButtonList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (profileButtonList[index] == "Messages") {
                            return ListTile(
                              onTap: () {
                                Get.to(() => MessagesPage(
                                  receiverId: "receiver_id_value",
                                  deliveryManId: "delivery_man_id_value",
                                  chatRoomId: "chat_room_id_value",
                                ));
                              },
                              leading: Image.asset(profileButtonsIcon[index], width: 22),
                              title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                            );
                          } else {
                            return ListTile(
                              leading: Image.asset(profileButtonsIcon[index], width: 22),
                              title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                            );
                          }
                        },
                      ).box.white.rounded.padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class MessagesPage extends StatefulWidget {
  final String receiverId;
  final String deliveryManId;
  final String chatRoomId;

  MessagesPage({
    required this.receiverId,
    required this.deliveryManId,
    required this.chatRoomId,
  });

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  late TextEditingController _messageController;
  late ScrollController _scrollController;
  late List<ChatMessage> _messages;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _scrollController = ScrollController();
    _messages = [];

    _loadMessages();
  }

  void _loadMessages() {
    FirebaseFirestore.instance
        .collection('messages')
        .doc(widget.chatRoomId)
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      setState(() {
        _messages = snapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          var timestamp = data['timestamp'];

          DateTime? dateTime = timestamp != null
              ? (timestamp is Timestamp ? timestamp.toDate() : null)
              : null;

          return ChatMessage(
            id: doc.id,
            text: data['text'],
            senderId: data['senderId'],
            timestamp: dateTime ?? DateTime.now(),
          );
        }).toList();
      });

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textInputAction: TextInputAction.send,
              onSubmitted: _handleSendMessage,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message',
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSendMessage(_messageController.text),
          ),
        ],
      ),
    );
  }

  void _handleSendMessage(String message) {
    if (message.trim().isNotEmpty) {
      FirebaseFirestore.instance
          .collection('messages')
          .doc(widget.chatRoomId)
          .collection('chats')
          .add({
        'text': message,
        'senderId': widget.receiverId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _sendAutoReply();

      _messageController.clear();
    }
  }

  void _sendAutoReply() {
    final List<String> autoReplies = [
      'Delivery Boy: Your message has been received!',
      'Delivery Boy: Thank you for reaching out!',
      'Delivery Boy: We appreciate your inquiry!',
    ];

    final random = Random.secure();
    final randomIndex = random.nextInt(autoReplies.length);

    FirebaseFirestore.instance
        .collection('messages')
        .doc(widget.chatRoomId)
        .collection('chats')
        .add({
      'text': autoReplies[randomIndex],
      'senderId': widget.deliveryManId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  var message = _messages[index];
                  return ListTile(
                    title: Text(message.text),
                    subtitle: Text(message.senderId),
                    tileColor: message.senderId == widget.receiverId
                        ? Colors.pinkAccent[100]
                        : (message.senderId == widget.deliveryManId ? Colors.white : null),
                  );
                },
              ),
            ),
            Divider(height: 1),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: _buildMessageComposer(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

class ChatMessage {
  final String id;
  final String text;
  final String senderId;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.text,
    required this.senderId,
    required this.timestamp,
  });
}

