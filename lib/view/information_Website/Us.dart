import 'package:flutter/material.dart';

import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';
class Us extends StatelessWidget {
  const Us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text_Style textstyle=new Text_Style();
    size_phone().init(context);
    return  Container(
      height:size_phone.width!<=600? size_phone.height:size_phone.height!*.4,
      width:size_phone.width ,
      child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
      size_phone.width!<=600?1:2,childAspectRatio:size_phone.width!<=600?1.5:.5 ),
      children: [
        Container(
          padding: EdgeInsets.all(size_phone.defualtsize!*2),
          width: size_phone.width!/2,
          child: Column(
          children: [
          Align(alignment: Alignment.center,child: Container(margin:EdgeInsets.only(right:size_phone.defualtsize!*2 ),
          child: Text('نحن',style: textstyle.contact_info(
          color: Color(0xCCBB5406), size: 28, FontWeight: FontWeight.bold, fontname: 'header'
          ),
          ))),
          Wrap(
            children: [
              RichText(
              textDirection:TextDirection.rtl,
              text: TextSpan(
              text: ' منصة تنوير للمشاريع الصغيرة والمنتناهية الصغر \n منصة صممت لتقديم الدعم لأصحاب المشاريع الصغيرة والمنتناهية الصغر لتساعد في إرتقاء المجتمعات حيث توفر لهم التمويل اللازم لتنمية مشاريعهم وتحويل أفكارهم الإبداعية الى مشاريع ربحية تخدم الفرد والمجتمع وتوفر لهم التدريب اللازم لتنمي مهاراتهم في حرفهم وتدعم منتجاتهم عن طريق تسويقها لهم في المنصة'
              ,style: textstyle.StyleFount(
              size: 24, fountFamily: 'body', color: Color(0xFFCDCDCD)),
              )
              ),
            ],
          ),
          ],
          )),
        Container(
            width: size_phone.width!/2,
          padding: EdgeInsets.all(size_phone.defualtsize!*2),
            child: Column(
            children: [
            Align(alignment: Alignment.center,child: Container(margin:EdgeInsets.only(right:size_phone.defualtsize!*2 ),
            child: Text('أهدافنا',style: textstyle.contact_info(
            color: Color(0xCCBB5406), size: 28, FontWeight: FontWeight.bold, fontname: 'header'
            ),
            ))),
            Wrap(
              children: [
                RichText(
                textDirection:TextDirection.rtl,
                text: TextSpan(
                text: ' المساهمة في تنمية اقتصاد البلاد عن طريق دعم المشاريع الصغيرة والمنتناهية الصغر تحسين ظروف المعيشة عن طريق تسهيل عمليات توفير التمويل تنمية مهارات الأفراد لإتقان حرفهم ولزيادة جودة منتجاتهم السماح للأفراد بتسويق منتجاتهم في المنصة مما يزيد من فرصة زيادة دخلهم'
                ,style: textstyle.StyleFount(
                size: 24, fountFamily: 'body', color: Color(0xFFCDCDCD)),
                )
                ),
              ],
            ),
            ],
            ),
            ),











      ])
    );
  }
}
// Row(
// children: [
// Expanded(
// child: Column(
// children: [
// Container(
// width: size_phone.width!/2,
// child: Column(
// children: [
// Align(alignment: Alignment.center,child: Container(margin:EdgeInsets.only(right:size_phone.defualtsize!*2 ),
// child: Text('نحن',style: textstyle.contact_info(
// color: Color(0xCCBB5406), size: 28, FontWeight: FontWeight.bold, fontname: 'header'
// ),
// ))),
// RichText(
// textDirection:TextDirection.rtl,
// text: TextSpan(
// text: ' منصة تنوير للمشاريع الصغيرة والمنتناهية الصغر \n منصة صممت لتقديم الدعم لأصحاب المشاريع الصغيرة والمنتناهية الصغر\n لتساعد في إرتقاء المجتمعات حيث توفر لهم التمويل اللازم لتنمية مشاريعهم وتحويل\n أفكارهم الإبداعية الى مشاريع ربحية تخدم الفرد والمجتمع وتوفر لهم التدريب\n اللازم لتنمي مهاراتهم في حرفهم وتدعم منتجاتهم عن طريق تسويقها لهم في المنصة'
// ,style: textstyle.StyleFount(
// size: 24, fountFamily: 'body', color: Color(0xFFCDCDCD)),
// )
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Column(
// children: [
// Container(
// width: size_phone.width!/2,
// child: Column(
// children: [
// Align(alignment: Alignment.center,child: Container(margin:EdgeInsets.only(right:size_phone.defualtsize!*2 ),
// child: Text('أهدافنا',style: textstyle.contact_info(
// color: Color(0xCCBB5406), size: 28, FontWeight: FontWeight.bold, fontname: 'header'
// ),
// ))),
// RichText(
// textDirection:TextDirection.rtl,
// text: TextSpan(
// text: ' المساهمة في تنمية اقتصاد البلاد عن طريق دعم المشاريع الصغيرة والمنتناهية الصغر \nتحسين ظروف المعيشة عن طريق تسهيل عمليات توفير التمويل تنمبة مهارات \nالأفراد لإتقان حرفهم ولزيادة جودة منتجاتهم \nالسماح للأفراد بتسويق منتجاتهم في المنصة مما يزيد من فرصة زيادة دخلهم\n'
// ,style: textstyle.StyleFount(
// size: 24, fountFamily: 'body', color: Color(0xFFCDCDCD)),
// )
// ),
// ],
// ),
// ),
// ],
// ),
//
// ],
// ),