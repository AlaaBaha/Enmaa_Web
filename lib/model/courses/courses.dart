import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'courseDetail.dart';


class courses {
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('courses');
  List<courseDetail> ListCourse=[];
  var _firestore = FirebaseFirestore.instance;
  final userAuth=Auth.FirebaseAuth.instance;
  Future<List<courseDetail>> getALLCourse(String catalog) async{

    var collection = FirebaseFirestore.instance.collection('courses').where('catalog', isEqualTo: catalog);
    //snapshots().map((event) =>
    //     event.docs.map((e) => courseDetail.fromJson(e.data())).toList());
    List<courseDetail>courseList=[];
    var querySnapshot = await collection.get();

    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      courseList.add( courseDetail.fromJson(data));

    }
    return courseList;
  }
  Future<List<courseDetail>> searchCourse (String catalog) async{

    var collection = FirebaseFirestore.instance.collection('courses').where('catalog', arrayContains: catalog);
   List<courseDetail>courseList=[];
    var querySnapshot = await collection.get();

    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      courseList.add( courseDetail.fromJson(data));

    }
    return courseList;
  }
  static List<String> template=[];
 List<String> Cataloger() {
    var store= FirebaseFirestore.instance.collection("courses").get().then((value){
      value.docs.forEach((element) {
      var data=  element.data();
      if(!template.contains(data["catalog"]))
        template.add(data["catalog"]);
      });
    });
    return template;

}
ALLCataloger() {
    var store= FirebaseFirestore.instance.collection("courses").snapshots();

    return store;

}

  // Stream<QuerySnapshot<Map<String, dynamic>>> searchCourse (String catalog,String searchitem) {
  //
  //   var collection = _firestore.collection('courses').
  //  where('catalog', isEqualTo: catalog).where('Name', arrayContains:searchitem).snapshots().map((event) =>
  //       event.docs.map((e)  {
  //           if(e.data()["Name"].)courseDetail.fromJson(e.data());}).toList());
  //
  //
  //   // }
  //   return collection;
  // }
  //
  Future<bool> setRequest(String catalog, String think) async {
    bool check=false;
    var collection =await _firestore.collection('RequestTraining').add(
        {'User_Email':userAuth.currentUser!.email,
      'catalog':catalog,
      'think':think
    }
    ).whenComplete(() => check=true);
    return check;
  }


}