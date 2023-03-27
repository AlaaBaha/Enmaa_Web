import 'package:flutter/cupertino.dart';

class courseDetail{
  final String image;
  final String name;
  final String link;
  final String catalog;
  //final bool Fav;

  courseDetail({required this.image, required this.name,required this.link,required this.catalog});



  dynamic toJson() => {
  {
  'image':this.image,
  'name':this.name,
  'link':this.link,
    'catalog':this.catalog
  }};

  factory courseDetail.fromJson(Map<String, dynamic> json) {
    return courseDetail(image: json['image'], name: json['Name'], link: json['link'],
        catalog: json['catalog']);
  }


}