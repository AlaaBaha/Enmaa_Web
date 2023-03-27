// ****** THIS CODE IS EDITED BY A ******


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/size_phone.dart';

import '../../config/Name_Page.dart';
import '../../config/Text_Style.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../controller/providerManager/keep_login.dart';
import '../Marketing/Fun_Market.dart';
import '../Widgets/Button.dart';
class dev_Market extends StatelessWidget {
  Fun_Market market= new Fun_Market();
Text_Style text_style=Text_Style();
  keep_login? keeplog;
  @override
  Widget build(BuildContext context) {
    var sizephone=MediaQuery.of(context).size;
    size_phone().init(context);
    keep_login keeplog=Provider.of<keep_login>(context,listen: false);
    return
    Material(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
              height: sizephone.height,
                width: sizephone.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/marketing_dev.jpg'),
              fit: BoxFit.fitWidth
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Container(
              padding: sizephone.width>600?EdgeInsets.all(20):EdgeInsets.all(0),
              child: text_style.animationText('يمكنك التسوق عبر منصتنا ورؤية جميع المنتجات المعروضة فيها', text_style.headerP())))]),

              //############################################################
              SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Customer_config.CustomerButton("عرض المنتجات", Color(0xFF565656),size_phone.defualtsize!*1.8,
                     size_phone.defualtsize!*7.5,()=> Navigator.pushNamed(context,NamePage.show_Product))
               ],
              ),
            ],
          ))));
  }
}