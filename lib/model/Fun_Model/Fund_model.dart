import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'Fund_detail.dart';
class Fund_model{
  final store=FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage? _storage;
  Future<bool> sendFund({required String userEmail,required String nameuser,required String nameFile,Uint8List? ImgFile,
   required String detail_project,required double price_Fun})async{
    try {

      Reference reference=await firebase_storage.FirebaseStorage.instanceFor(bucket:"gs://enmaa-d75bd.appspot.com").ref('Prov_user').child(nameFile);
      final UploadTask upload=reference.putData(ImgFile!);
      upload.whenComplete(()async{
       String imageUrl=await upload.snapshot.ref.getDownloadURL();
        final res = await store.collection('Request_Funding').doc();
        Fund_detail details = new Fund_detail(fun_id: res.id,email_user:userEmail, nameuser: nameuser, provFile:imageUrl!,price_Fun: price_Fun,  describe: detail_project);
       await res.set(details.toMap());
        print('the fund success');
      });

      return true;
    }
    on FirebaseException catch(e){
      print('the fund fail');
      return false;
    }
  }
}