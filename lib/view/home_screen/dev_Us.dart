import 'package:flutter/material.dart';
import 'package:smallmicroproduct/config/Color_style.dart';
import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';
import '../information_Website/Us.dart';
import '../information_Website/contact_Us.dart';
class dev_Us extends StatelessWidget {
  const dev_Us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizephone=MediaQuery.of(context).size;
    size_phone().init(context);
    Text_Style textstyle=new Text_Style();
    return Material(
      color:Color_style().background(),
      child:  Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
            Row(
              children: [
                SafeArea(
                  child: Container(
                    child:content( 'Us'),
   ),
                ),
              ]),
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: content('contact_Us')),

              ],),


            ]),
        ),
      )
    
    );
  }
  Column content(String _class){
    return Column(

          children: [
            Container(
              child:(_class=="Us")? new Us():new contact_Us())
         ]);
  }

}
