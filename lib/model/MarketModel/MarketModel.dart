import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'detail.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:smallmicroproduct/model/MarketModel/detail.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
class MarketModel {
  late List<detail> listDetai;
  final store = FirebaseFirestore.instance.collection('product');
  firebase_storage.FirebaseStorage? _storage;
  final userAuth = Auth.FirebaseAuth.instance;

  Future<bool> insertDB(String nameFile, String namePro, Uint8List? ImgPath,
      String Catalog, double price, String describe, int Phone) async {
    try {
      String? imageUrl;
      Reference reference = await firebase_storage.FirebaseStorage.instanceFor(
          bucket: "gs://enmaa-d75bd.appspot.com").ref().child(nameFile);
      final UploadTask upload = reference.putData(ImgPath!);
      upload.whenComplete(() async {
        imageUrl = await upload.snapshot.ref.getDownloadURL();
        final res = await store.doc();
        detail details = await new detail(prod_id: res.id,
            userEmail: userAuth.currentUser!.email,
            namePro: namePro,
            ImgPath: imageUrl!,
            Catalog: Catalog,
            price: price,
            describe: describe,
            Phone: Phone);
        await res.set(details.toMap());
      });

      return true;
    }
    on FirebaseException catch (e) {
      print(e.code);
      return false;
    }
  }

  Future<bool> deleteUserProduct(String? email) async {
    try {
      final res = await store.where('email', isEqualTo: email);
      await res.get().then((snapshot) async {
        // for(DocumentSnapshot ds in snapshot.docs)  {
        //    ds.reference.delete();
        // }

        for (DocumentSnapshot ds in snapshot.docs) {
          await deleteProduct(ds.id);
        }
      });

      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      await store.doc(id).delete();
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> Allproduct(String search) {
    if(search=="")
    {var collection = FirebaseFirestore.instance.collection('product')
        .snapshots();
    return collection;}
    else
    {var collection = FirebaseFirestore.instance.collection('product').where("Catalog",isEqualTo: search)
        .snapshots();
    return collection;}
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> MeProduct(String email) {
    List Allproduct = [];
    var collection = FirebaseFirestore.instance.collection('product').where(
        'userEmail', isEqualTo: email).snapshots();
    // var querySnapshot =  _collectionRef.snapshots();
    // final allData = querySnapshot.map((event) => event.docs.map((e) =>Allproduct.add(e.data())).toList());
    // print(allData);
    return collection;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDetailProdduct(String id) {
    var collection = FirebaseFirestore.instance.collection('product').where(
        "prod_id", isEqualTo: id).snapshots();
    return collection;
  }

  UpdateProduct(String key, dynamic val, String? argment) async {
    try {
      await store.doc(argment).update({
        key: val
      });
      return true;
    }
    catch (e) {
      return false;
    }
  }

  UpdateImage(String key, String nameFile, Uint8List? ImgPath,
      String id) async {
    String imageUrl;
    Reference reference = await firebase_storage.FirebaseStorage.instanceFor(
        bucket: "gs://smallproduct-87765.appspot.com").ref().child(nameFile);
    final UploadTask upload = reference.putData(ImgPath!);
    upload.whenComplete(() async {
      imageUrl = await upload.snapshot.ref.getDownloadURL();
      UpdateProduct(key, imageUrl, id);
    });
  }
  static List<String> template=[];
  List<String> Cataloger() {
    var store= FirebaseFirestore.instance.collection("product").get().then((value){
      value.docs.forEach((element) {
        var data=  element.data();
        if(!template.contains(data["Catalog"]))
          template.add(data["Catalog"]);
      });
    });
    return template;

  }
}