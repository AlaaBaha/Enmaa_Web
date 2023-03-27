import 'package:flutter/material.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/Color_style.dart';
import '../Widgets/Button.dart';
class fun_Course extends StatelessWidget {
  var sizephone;

  Icon Fav=Icon(Icons.star_border);

 // List<String>? coursetype;
  @override
  Widget build(BuildContext context) {
    size_phone().init(context);
    return Container();
  }

  Container box_course({required BuildContext context,required String nameCourse,required String link,required String image}){
    return Container(
      margin: EdgeInsets.all(size_phone.defualtsize!*2),
      height:size_phone.defualtsize!*6 ,
      width: size_phone.defualtsize!*10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular(size_phone.defualtsize!*2)),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Color(0xFF050257).withOpacity(.5),
              offset: Offset(3,3),
              blurRadius: 3
          )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size_phone.defualtsize!*1),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover
          )
        ),
      height: size_phone.defualtsize!*8,
      width: size_phone.defualtsize!*11,
      ),
        Spacer(),
        Text(nameCourse, style:TextStyle(color:Color(0xFF050257), fontSize: 21,fontFamily: 'body')),
    Spacer(),
    Customer_config.CustomerButton(  "عرض الكورس",colormarket.withOpacity(.2), size_phone.defualtsize!*2.3,
      size_phone.defualtsize!*7,
          (){
          lanucherurl(link);
        }, ),
        Spacer(),
        ]),

);
}

Future<void> lanucherurl(String link)async{
    Uri url=Uri.parse( link);
  if (await canLaunchUrl(url))
    await launchUrl(url);
  else
    // can't launch url, there is some error
    throw "Could not launch $url";
}
}
