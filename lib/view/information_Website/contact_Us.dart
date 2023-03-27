import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';
class contact_Us extends StatelessWidget {
   contact_Us({Key? key}) : super(key: key);
   Text_Style textstyle=new Text_Style();
BuildContext? context;
  @override
  Widget build(BuildContext context) {
    this.context=context;
    size_phone().init(context);
    return Column(
      children: [
        Center(child: Text('تواصل معنا',style: textstyle.contact_info(
            color: Color(0xCCBB5406), size: 23, FontWeight: FontWeight.bold, fontname: 'header'
        ),),),
    SizedBox(height: 50,),
    Container(
      height:size_phone.width!<=600? size_phone.height!*1.2:size_phone.height!*.2,
       width: size_phone.width,
       child: Padding(
         padding:  EdgeInsets.only(right:4),
         child: GridView(
           padding: EdgeInsets.only(right: size_phone.width!<=600?0:size_phone.defualtsize!*10),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount:
      size_phone.width!<=600?1:3,childAspectRatio:size_phone.width!<=600?2:.5,),
          children: [

                theinfo('TELEGRAM','images/info_contact/telegram.png'),
                theinfo('FACEBOOK','images/info_contact/facebook.png'),
                theinfo('EMAIL','images/info_contact/email.png'),
              ]


      ),
       ),
    ),
        Container(
          height:size_phone.height!*.2,
          width: size_phone.width,
          child: Column(children: [
            Text('جميع الحقوق محفوظة لدى',style: textstyle.StyleFount( size: 20, fountFamily: 'body', color: Colors.white),),
            Wrap(children: [Text('@ SUST 2022',style: textstyle.StyleFount( size: 20, fountFamily: 'body', color:Colors.white))])
          ],),
        )
      ],
    );
  }

  theinfo(String s,path) {
    return Container(
      margin:EdgeInsets.only(right:size_phone.width!<=600?size_phone.defualtsize!*15:0),
      height: size_phone.defualtsize!*12,
      width: size_phone.defualtsize!*15,
      child: Column(
        children: [
          Row(children:[
            Text(s,style:textstyle.contact_info(color: Color(0xFFCDCDCD), size: 23, FontWeight: FontWeight.normal, fontname: 'body')),
            Container(width:28,height:28,child: Image.asset(path),),
          ]),
         s=='EMAIL'?Row(
           children: [
             TextButton(onPressed: (){
               OpenEmail('smallProject@gmail.com');
             }, child: Text('Tanmyat@gmail.com',style:textstyle.contact_info(color:Color(0xCCBB5406), size: 22, FontWeight: FontWeight.normal, fontname: 'body'),)),
           ],
         ): s=='FACEBOOK'?
         Row(
           children: [
             TextButton(onPressed: (){
               openLink('https://www.facebook.com/profile.php?id=100090466803989&mibextid=ZbWKwl');
             }, child: Text('Tanmya@FaceBook',style:textstyle.contact_info(color:Color(0xCCBB5406), size: 22,FontWeight: FontWeight.normal, fontname: 'body'),)),
           ],
         ):
         Row(
           children: [
             TextButton(onPressed: (){
               openLink('https://t.me/ProjectsPlatfo');
             }, child: Text('t.me/Tanmya',style:textstyle.contact_info(color: Color(0xCCBB5406), size: 22,FontWeight: FontWeight.normal, fontname: 'body'),)),
           ],
         )
        ],
      ),
    );
  }
   Future<void> openLink(String link)async{
     Uri url=Uri.parse( link);
     if (await canLaunchUrl(url))
       await launchUrl(url);
     else
       // can't launch url, there is some error
       throw "Could not launch $url";
   }
   Future<void> OpenEmail(String link)async{
     launch('mailto:Pojectsplatform@gmail.com?subject=This is Subject Title&body=This is Body of Email');
   }
}
