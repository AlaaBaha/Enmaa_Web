import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
class VerficateEmail_Model {
final firestore=FirebaseFirestore.instance;
 Future<void> setEmailAndOTP(String? userEmail,int OTP)async{
  await firestore.collection('OTP').doc(userEmail).set({
    "userEmail":userEmail,
    "OTP":OTP
  });
  }

Future<int> getotp(String email)async{
 try {
   var otp=0;
  await firestore
       .collection('OTP').where('userEmail',isEqualTo: email)
       .get()
       .then((QuerySnapshot querySnapshot) {
     querySnapshot.docs.forEach((doc) {
       otp= doc["OTP"];
     });
   });
      print(otp);
      return otp;
    }
    catch (e){
   return 0;
    }
  }

}
