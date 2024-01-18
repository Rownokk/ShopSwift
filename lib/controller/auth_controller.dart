import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:emart_app/consts/consts.dart';


class AuthController extends GetxController{
  var isloading= false.obs;
   var emailController=TextEditingController();
   var passwordController=TextEditingController();

  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;
    try {
    await auth.signInWithEmailAndPassword(email: emailController.text,password: passwordController.text);

    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }

return userCredential;
  }
  Future<UserCredential?> signupMethod({email,password,context}) async{
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }
  storeUserData({name,password,email}) async{
    DocumentReference store= await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
        "name":name,
      "password":password,
      "email":email,
      "imageUrl":" ",
      "id ":currentUser!.uid,
    });
    
  }
  signoutMethod(context) async{
    try{
       await auth.signOut();
    }catch(e){
      VxToast.show(context, msg:e.toString());
    }


  }
}