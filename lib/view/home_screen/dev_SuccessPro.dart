import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../config/Color_style.dart';
import '../successProj/projects.dart';
class dev_SuccessPro extends StatelessWidget {
  var sizephone;
  final List<String> imgList =['images/semsem.jpg','images/semsem 2.jpg','images/semsem.jpg'];
BuildContext? context;
  @override
  Widget build(BuildContext context) {
    this.context=context;
  sizephone=MediaQuery.of(context).size;
  return Directionality(
  textDirection:TextDirection.rtl,
  child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
  body: Column(
    children: [
      SizedBox(width: double.infinity,),
      Text("المشاريع الناجحة", style:TextStyle(fontFamily: 'body', fontWeight: FontWeight.bold, fontSize: 30,color: colormarket)),


      Container(
      height: sizephone.height*.45,
      child:  ChangeImages(),
      ),
    ],
  )));
  }
  CarouselSlider  ChangeImages() {
    return CarouselSlider(items:imgList.map((e) =>
        Container(
            width: sizephone.width*.7,
            child:  Stack(
              alignment: Alignment.bottomCenter,
                children: [
              Image.asset(e,fit: BoxFit.cover,),
            Container(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              color: Theme.of(context!).backgroundColor.withOpacity(.5),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(child: Text("مشروع معصرة زيت السمسم",style:TextStyle(fontFamily: 'body', fontSize: 22,color: colormarket)),onPressed: (){
                  Navigator.of(context!).push(MaterialPageRoute(builder: (ctx){
                    return semsem();
                  }));
                },),
              ],
            ),)]))).toList(),
      options: CarouselOptions(autoPlay: true,
          aspectRatio: 2,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,

          reverse: true),);

  }}