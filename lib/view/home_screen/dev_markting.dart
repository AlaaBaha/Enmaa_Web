import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/Color_style.dart';

import '../../config/Name_Page.dart';
import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';
import '../../controller/providerManager/keep_login.dart';
import '../Widgets/Button.dart';
class dev_markting extends StatelessWidget {
   dev_markting({Key? key}) : super(key: key);
  keep_login? keeplog;
  @override
  Widget build(BuildContext context) {
    keep_login keeplog=Provider.of<keep_login>(context,listen: false);
    size_phone size=size_phone();
    size.init(context);
    return Material(
      color: Theme
          .of(context)
          .backgroundColor,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: size_phone.defualtsize!*50,
          margin: EdgeInsets.only(
            left: size_phone.width !<= 600 ? size_phone.width !/ 20 : size_phone
                .width !/ 10,
            right: size_phone.width !<= 600 ? size_phone.width! / 20 : size_phone
                .width !/ 10,

          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color_style.ColorContainer,
          ),

          child:
              Container(
                padding: EdgeInsets.only(right: size_phone.defualtsize!*1),
                height: size_phone.height! * .5,
                width: size_phone.width !<= 600 ? size_phone.width !* .9 : size_phone
                    .width! / 2.5,
                child: Column(
                    children: [
                      Align(alignment: Alignment.center,child: Text(' شروط الحصول على تسويق لمنتجك', style: TextStyle(fontFamily: "header", fontSize: 27,color: colormarket,fontWeight: FontWeight.bold),)),
                      Spacer(),
                      contentMarket('أن يكون المنتج ملائم ويمكن الإستفادة منه'),  Divider(),
                      contentMarket('أن يكون سعر المنتج مناسب ويتوافق مع أسعار السوق'),  Divider(),
                      contentMarket('أن يكون المنتج ذو جودة عالية'),  Divider(),
                      contentMarket('أن يتم توصيف المنتج ومواصفاته بشكل واضح' ),  Divider(),
                      contentMarket('أن يتم توصيف مكان المنتج وطريقة الطلب عن طريق وضع رقم للتواصل'),  Divider(),
                      Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: Customer_config.CustomerButton("سوق منتجك", colormarket,size_phone.defualtsize!*1.8,
                        size_phone.defualtsize!*7.5,(){
    keeplog!.isLogin==false?Navigator.pushNamed(context, NamePage.login):Navigator.pushNamed(context, NamePage.Marketed);})
                      ),
                      Spacer(),
                    ]),
              ),
        ),
      ),
    );
  }
  contentMarket(String text){
    return Row(children: [
      Icon(Icons.check_circle_rounded,size: 18,color: Colors.grey,),
      SizedBox(width: size_phone.defualtsize!*0.3,),
      Text(' ${text} ',style: Text_Style().content(colormarket),softWrap: true,)
    ],);
  }
}
