import 'package:flutter/material.dart';
import 'package:smallmicroproduct/config/Color_style.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import 'package:provider/provider.dart';
import '../../config/Name_Page.dart';
import '../../config/Text_Style.dart';
import '../../controller/providerManager/keep_login.dart';
import '../Widgets/Button.dart';
class dev_Funding extends StatelessWidget {

  Color_style color_style = Color_style();
  keep_login? keeplog;

  @override
  Widget build(BuildContext context) {
    keep_login keeplog=Provider.of<keep_login>(context,listen: false);
    size_phone size=size_phone();

    size.init(context);
    return Container(
      color: Theme .of(context).backgroundColor,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(

          height: size_phone.height!* .6,
          margin: EdgeInsets.only(
            left: size_phone.width! <= 600 ? size_phone.width !/ 20 : size_phone
                .width! / 10,
            right: size_phone.width! <= 600 ? size_phone.width! / 20 : size_phone
                .width !/ 10,

          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),

            color: Color_style.ColorContainer,
          ),
child: Container(
  padding: EdgeInsets.only(right: size_phone.defualtsize!*1),
  height: size_phone.height! * .6,
  width: size_phone.width! <= 600 ? size_phone.width !* .9 : size_phone
      .width !/ 2.5,
  child: Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Align(alignment: Alignment.center,child: Text(' شروط الحصول على تمويل لمنتجك', style: TextStyle(fontFamily: "header", fontSize: 27,color: colormarket,fontWeight: FontWeight.bold),)),

        Spacer(),
        contentFund('أن لا يتجاوز رأس المال المطلوب لتنفيذ المشروع 100,000'),
        Divider(),
        contentFund('أن لا يقل رأس المال المطلوب لتنفيذ المشروع عن 50,000', ),
        Divider(),
        contentFund('أن لا يتجاوز عدد العاملين بالمشروع 20 عامل ولا يقل عن عاملين', ),
        Divider(),
        contentFund('أن يكون طالب التمويل سوداني الجنسية'),
        Divider(),
        contentFund('أن يمتلك صاحب الطلب مشروع قائم بشرط أن يكون مشروع صغير أو متناهي الصغر'),
        Divider(),
        contentFund('أن يكون عمر صاحب الطلب بين 20-65 عاماَ'),
        Divider(),
        contentFund('أن يمتلك صاحب الطلب بطاقة رقم قومي سارية المفعول'),
        Spacer(),
        Align(
            alignment: Alignment.bottomCenter,
            child: Customer_config.CustomerButton("اطلب تمويل", colorOrigin,size_phone.defualtsize!*2,size_phone.defualtsize!*10,(){
              keeplog!.isLogin==false?Navigator.pushNamed(context, NamePage.login):
              Navigator.of(context).pushNamed(NamePage.funding);
            })
        ),
         Spacer()
      ]),
),
          //حتي اشعار اخررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررررر
          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children:
          //   [

              // if(size_phone.width !>= 600)
              //   Column(children: [
              //     Container(
              //       decoration: BoxDecoration(
              //           boxShadow: [BoxShadow(
              //               offset: Offset(3, 3),
              //               spreadRadius: 1,
              //               blurRadius: 20,
              //               color: Color(0xCCF2700D)
              //           )
              //           ],
              //           borderRadius: BorderRadius.only(
              //             topRight: Radius.circular(400),
              //             bottomRight: Radius.circular(25),
              //             topLeft: Radius.circular(25),
              //             bottomLeft: Radius.circular(25),),
              //           // image: DecorationImage(
              //           //  // image: AssetImage('images/idea.jpg'),
              //           //   fit: BoxFit.cover,
              //           // )
              //       ),
              //       height: size_phone.defualtsize!*26,
              //       width: size_phone.width! / 2.5,)
              //   ],),
          //  ],
         // ),

        ),
      ),
    );
  }
  contentFund(String text){
return Row(children: [
  Icon(Icons.check_circle_rounded,size: 18,color: Colors.grey,),
  SizedBox(width: size_phone.defualtsize!*0.3,),
  Text(' ${text} ',style: Text_Style().content(colorOrigin),softWrap: true,)
],);
  }
}