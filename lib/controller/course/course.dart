import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:smallmicroproduct/model/courses/courseDetail.dart';
import 'package:smallmicroproduct/model/courses/courses.dart';

import '../../config/Color_style.dart';
import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';
class course{
courses coursdb=courses();
List<String> getCatlog= courses().Cataloger();
var getAllCatlog= courses().ALLCataloger();
Future<void> RequestTraining(BuildContext context,String Catalog,String think, String s)async{

  final res= await coursdb.setRequest(Catalog,think);
  if(res==true)
    size_phone().init(context);
  if(res)
  {
    await CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      onConfirmBtnTap: (){
        Navigator.pop(context);
      },
      text: 'تم ارسال طلب التدريب ',

      width: size_phone.defualtsize!*10,
      confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
      backgroundColor:colormarket,
      confirmBtnColor: colormarket,
      title: "",
      confirmBtnText: "موافق",
    );}
  else
  {CoolAlert.show(context: context, type: CoolAlertType.error,
    width: size_phone.defualtsize!*10,
    confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
    onConfirmBtnTap: (){Navigator.pop(context);},
    backgroundColor:colormarket,
    confirmBtnColor: colormarket,
    title: "",
    confirmBtnText: "موافق",
    text: "تاكد من الاتصال بالانترنت",
  );}
}
}