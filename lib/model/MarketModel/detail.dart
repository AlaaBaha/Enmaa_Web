import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class detail{
  final  String? userEmail;
  final String namePro;
  final String ImgPath;
  final String Catalog;
  final double price ;
  final String describe;
  final int Phone;
  final String prod_id;
  detail({required this.userEmail, required this.namePro, required  this.ImgPath,required this.Catalog,required this.price,required this.describe, required this.Phone, required this.prod_id});
  Map<String,dynamic> toMap(){
    return{
      'userEmail':this.userEmail,
      'namePro':this.namePro,
      'ImgPath':this.ImgPath,
      'Catalog':this.Catalog,
      'price':this.price,
      'describe':this.describe,
    'Phone':this.Phone,
      "prod_id":this.prod_id,

    };
  }
  factory detail.fromJson(Map<String, dynamic> toMap){
    return detail(userEmail: toMap['userEmail'], namePro: toMap['namePro'], ImgPath: toMap['ImgPath'],
        Catalog: toMap['Catalog'], price: toMap['price'], describe: toMap['describe'], Phone: toMap['Phone'], prod_id: 'prod_id');
  }

}