import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../view/login/VerficationEmail.dart';
import '../MarketModel/MarketModel.dart';
import 'UserModel.dart';

class Auth_Model {
final _auth=FirebaseAuth.instance;
var process=false;
Timer? timer;
bool verficate=false;
var store= FirebaseFirestore.instance.collection("user");

Future<bool> deleteUser(String? email)async{
  try
  {

    await FirebaseFirestore.instance.collection("customer").doc(email).delete();
    return true;}
  catch(e){
    return false;
  }
}
VerficationnewEmail(String? email) async {
  try
  {
print(store.doc(email).id);
print(email);
    await store.doc(email).id==email;
    return false;}
  catch(e){
    return true;
  }
}
static bool ischeck=false;
Future<String> log(String email, String password)async {
  UserModel mode =UserModel();
  try{
    // store.get().then((value) {
    //   value.docs.forEach((element) {
    //     if(element.data()["email"]==email)
    //        ischeck=true;
    //
    //
    //   });
    // });
       UserCredential userCredential= await _auth
            .signInWithEmailAndPassword(email: email, password: password);

    return "true";
    }

  on FirebaseException catch(e){
    print(e.code);
   return e.code;

  }}
Future<String> signUp(String email, String password)async {

  try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((uid) {
        setDetail(email,password,_auth.currentUser!.metadata.lastSignInTime.toString());
     } );
        return "true";
    }
  on FirebaseException catch(e){

    return e.message!;
  }

}

setDetail(String email, String password,String? date) async{
  UserModel mode=UserModel();
  mode.email=email;
  mode.password=password;
  mode.date=date;
  await store.doc(_auth.currentUser?.email).set(mode.toMap());
}
Future<bool> signOut(BuildContext context) async {
  try {
    await _auth.signOut();
    return true;

  } on FirebaseAuthException catch (e) {
    return false;
    // Displaying the error message
  }
}

// DELETE ACCOUNT
Future<bool> deleteAccount(BuildContext context, String? email) async {
  try {
      //delete user  product from firestore
     await  MarketModel().deleteUserProduct(email);
       // delte user from firestore
      await deleteUser(email);
          await _auth.currentUser!.delete();
    return true;
  } on FirebaseAuthException catch (e) {
    return false;
  }
}
}





