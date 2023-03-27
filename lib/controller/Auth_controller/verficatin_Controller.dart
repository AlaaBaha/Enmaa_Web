import 'dart:convert';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:smallmicroproduct/view/home_screen/home_screen.dart';
import 'package:smallmicroproduct/view/login/VerficationEmail.dart';
import 'package:flutter/material.dart';
import '../../config/Color_style.dart';
import '../../config/Name_Page.dart';
import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';
import '../../model/Auth_Model/Auth_DB.dart';
import '../../model/Auth_Model/verficationEmail.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:provider/provider.dart';

import '../providerManager/keep_login.dart';

class verfication_controller{
  Future<bool> VeriFicationEmail(String? useremail)async{
    // String username = 'aloyabaha@gmail.com';
try{ int otp =Random().nextInt(100001)+100000;
  print(otp);
  //int otp =Random().nextInt(100001)+100000;
  // final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  // const seviceid="service_tquibfb";
  // const templateid="template_5c1pizp";
  // const userid="RpmOL5n-OG1C_fx2Y";
  //
  // final reponend=await http.post(url,
  //     headers: {'Content-Type':'application/json'},
  //     body: json.encode({
  //       "service_id":seviceid,
  //       "template_id":templateid,
  //       "user_id":userid,
  //       "template_params":{
  //         "name":"منصة إنماء   ",
  //         "subject":"للتحقق من بريدك الالكتروني  ",
  //         "message":"الرجاء ادخال الرمز الاتي لتتم عملية انشاء الحساب بنجاح ${otp}",
  //         "user_email":useremail!
  //       },
  //       "accessToken":"HMyW3xKrSf_CPpGYUmhiX"}));
  // reponend.statusCode;
  // print(reponend.body);
  // if(reponend.statusCode==200)
  //  { print(  reponend.statusCode);
   await VerficateEmail_Model().setEmailAndOTP(useremail,otp);//}
  return true;
}
catch (e){
  return false;
}

  }
  Auth_Model auth=Auth_Model();
  keep_login? keeplog;
  getOtpfromdata(BuildContext context,String email,String password,int otp)async {
     int response = await VerficateEmail_Model().getotp(email) ;
    size_phone().init(context);
    if (response !=0) {

    if (otp== response) {
auth.signUp(email,password);
CoolAlert.show(
        onConfirmBtnTap: (){
          keeplog=Provider.of<keep_login>(context,listen: false);
          keeplog!.changeUserAuth();
          Navigator.of(context).pushNamed(NamePage.Home);

        },
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        context: context,
        type: CoolAlertType.success,
        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
          width: size_phone.defualtsize!*10,
        title: "",
        confirmBtnText: "موافق",
         text: 'تمت عملية التحقق بنجاح...مرحبا بك',
      );


    }
    else {
      CoolAlert.show(context: context,
          confirmBtnTextStyle: Text_Style().StyleFount(size: 18, fountFamily: "body", color: Colors.white),
        type: CoolAlertType.error,
        backgroundColor:colormarket,
        confirmBtnColor: colormarket,
        title: "",
        confirmBtnText: "موافق",
        width: size_phone.defualtsize!*10,
       text: 'رقم التحقق غير صحيح'
    );}}
    else{
      CoolAlert.show(context: context,
          confirmBtnTextStyle: Text_Style().StyleFount(size: 18, fountFamily: "body", color: Colors.white),
          type: CoolAlertType.error,
          width: size_phone.defualtsize!*10,
          backgroundColor:colormarket,
          confirmBtnColor: colormarket,
          title: "",
          confirmBtnText: "موافق",
          text: 'تاكد بالاتصال بالانترنت'
      );
    }



  }}