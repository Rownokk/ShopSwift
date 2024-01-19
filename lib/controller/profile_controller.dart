import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class ProfileController extends GetxController{
var profileImagePath =''.obs;
var nameController= TextEditingController();
var passController= TextEditingController();
var profileImageLink='';
var isloading=false.obs;

changeImage(context) async{
  try{
    final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
    if(img==null)
      return;
    profileImagePath.value=img.path;

  }on PlatformException catch(e){
    VxToast.show(context,msg:e.toString());
  }
}
uploadProfileImage() async{
  var filename = basename(profileImagePath.value);
  var destination='images/${currentUser!.uid}/$filename';
  Reference ref= FirebaseStorage.instance.ref().child(destination);
  await ref.putFile(File(profileImagePath.value));
  profileImageLink= await ref.getDownloadURL();

}
updateProfile({name,password,imgUrl}) async{
  var store=firestore.collection(usersCollection).doc(currentUser!.uid);
 await store.set({
    "name":name,
    "password":password,
    "imageUrl":imgUrl
  },SetOptions(merge: true));
  isloading(false);
}

}