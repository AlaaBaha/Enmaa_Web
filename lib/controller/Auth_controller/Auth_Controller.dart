import"package:flutter/material.dart";
import 'package:cool_alert/cool_alert.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/size_phone.dart';

import '../../config/Color_style.dart';
import '../../config/Color_style.dart';
import '../../config/Color_style.dart';
import '../../config/Name_Page.dart';
import '../../config/Text_Style.dart';
import '../../model/Auth_Model/Auth_DB.dart';
import '../../view/login/VerficationEmail.dart';
import '../providerManager/keep_login.dart';

class Auth_Controller{
  size_phone size=size_phone();
  Auth_Model auth=Auth_Model();
  keep_login? keeplog;
  VerficationnewEmail(BuildContext context, String email)async{
   var val=await auth.VerficationnewEmail(email);
   print(val);
   if(val){
   return  CoolAlert.show(
       confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
       onConfirmBtnTap: ()async{
         Navigator.push(context, MaterialPageRoute(builder: (context){
           return  VerficationEmail();
         }));} ,
       backgroundColor:colormarket,
       confirmBtnColor: colormarket,
       title: "",
       confirmBtnText: "موافق",
       width: 100,
       context: context,
       type: CoolAlertType.success,
       text: "تم انشاء الحساب",
     );
   }

   else{
     return CoolAlert.show(
       confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
       onConfirmBtnTap: ()async{
         Navigator.pop(context);
       } ,
       backgroundColor:colormarket,
       confirmBtnColor: colormarket,
       title: "",
       confirmBtnText: "موافق",
       width: 100,
       context: context,
       type: CoolAlertType.info,
       text: "لديك جساب بالفعل قم بتسجيل الدخول",
     );
   }

  }
  SignUpAlert(BuildContext context,email, password, dynamic Function() param3 )async{
    size.init(context);
    String val=await auth.signUp(email, password);
    if(val=="true")
    {
        CoolAlert.show(
          onConfirmBtnTap: param3,
          backgroundColor:colormarket,
          confirmBtnColor: colormarket,
          title: "",
          confirmBtnText: "موافق",
          width: 100,
        context: context,
        type: CoolAlertType.success,
        text: "تم انشاء الحساب",
          confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),


      );}
    else   if(val=="The email address is already in use by another account."){
      CoolAlert.show(
        onConfirmBtnTap: (){
          Navigator.pushNamed(context, NamePage.login);
        },
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        title: "",
        confirmBtnText: "موافق",
        width: 100,
        context: context,
        type: CoolAlertType.warning,
        text: "لديك جساب بالفعل قم بتسجيل الدخول",
        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),


      );}
    else   if(val=="network-request-failed"){
      CoolAlert.show(
        onConfirmBtnTap: (){
          Navigator.pop(context);
        },
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        title: "",
        confirmBtnText: "موافق",
        width: 100,
        context: context,
        type: CoolAlertType.error,
        text: "تاكد من الاتصال بالانترنت",
        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),


      );}

    else
      CoolAlert.show(
        onConfirmBtnTap: (){Navigator.pop(context);},
        context: context,
        type: CoolAlertType.error,
        width: 100,
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        title: "",
        confirmBtnText: "موافق",
        text: val,
        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
      );
  }
  LoginAlert(BuildContext context,String email,String password, )async{
    size.init(context);
    String val= await auth.log(email, password);
    keeplog=Provider.of<keep_login>(context,listen: false);
    if(val=="true")
    {
      CoolAlert.show(
        onConfirmBtnTap: (){keeplog!.changeUserAuth();
         Navigator.pushNamed(context, NamePage.Home);
        } ,
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        title: "",
        confirmBtnText: "موافق",
        confirmBtnTextStyle: Text_Style().StyleFount(size: 18, fountFamily: "body", color: Colors.white),
        width: 100,
        context: context,
        type: CoolAlertType.success,
        text: "تم تسجيل الدخول",
      );

    }
    else   if(val=="network-request-failed"){
      CoolAlert.show(
        onConfirmBtnTap: (){
          Navigator.pushNamed(context, NamePage.login);
        },
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        title: "",
        confirmBtnText: "موافق",
        width: 100,
        context: context,
        type: CoolAlertType.warning,
        text: "تاكد من الاتصال بالانترنت ",
        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),


      );}
    else
      CoolAlert.show(
        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
        onConfirmBtnTap: (){Navigator.pop(context);},
        context: context,
        type: CoolAlertType.error,
        width: 100,
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        title: "",
        confirmBtnText: "موافق",
        text: " تاكد من صحة البيانات المدخلة",
      );

  }
  DeletAccountAlert(BuildContext context, String email)async{
    size.init(context);
    bool? val;
    keeplog=Provider.of<keep_login>(context,listen: false);
      CoolAlert.show(
        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
        onConfirmBtnTap: ()async{
          val=await auth.deleteAccount(context,email!);
          Navigator.popAndPushNamed(context,NamePage.Home);
          requestVerfication(val!,context);} ,
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        title: "",
        confirmBtnText: "موافق",
        width: 100,
        context: context,
        type: CoolAlertType.warning,
        text: "هل تريد مسح الحساب",
      );

  }
  LogoutAlert(BuildContext context)async{
    size.init(context);
    bool val= await auth.signOut(context);
    keeplog=Provider.of<keep_login>(context,listen: false);
    if(val){
    CoolAlert.show(
      onConfirmBtnTap: (){
        keeplog!.changeUserAuth();
        Navigator.pushNamed(context, NamePage.Home);} ,
      backgroundColor:colormarket,
      confirmBtnColor: colormarket,
      title: "",
      confirmBtnText: "موافق",
      width: 100,
      context: context,
      type: CoolAlertType.success,
      text: " تمت عملية تسجيل الخروج",
      confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
    );

  }
  else
  CoolAlert.show(
  onConfirmBtnTap: (){},
  context: context,
  type: CoolAlertType.error,
  width: 100,
    backgroundColor:colormarket,
    confirmBtnColor: colormarket,
    title: "",
    confirmBtnText: "موافق",
  text: "تاكد من الاتصال بالانترنت",
    confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
  );


  }

  void requestVerfication(bool val,BuildContext context) {
    if(val)
    {
      CoolAlert.show(

        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
        onConfirmBtnTap: (){
          Navigator.pushNamed(context, NamePage.Home);
          keeplog!.changeUserAuth();} ,
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        width: 100,
        context: context,
        type: CoolAlertType.success,
        text: " تم حذف الحساب ",
      );

    }
    else
      CoolAlert.show(

        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
        onConfirmBtnTap: (){},
        context: context,
        type: CoolAlertType.error,
        width: 100,
        backgroundColor: Colors.red,
        text: "فشل  حذف الحساب ",
      );
  }
}
