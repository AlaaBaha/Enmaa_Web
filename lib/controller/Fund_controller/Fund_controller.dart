import 'dart:typed_data';

import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smallmicroproduct/model/Fun_Model/Fund_model.dart';

import '../../config/Color_style.dart';
import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';
class Fund_controller{
  Fund_model fund_controller=Fund_model();

  Future<void> RequestFundControl(BuildContext context, String UserEmail,String nameuser,String FileName,
      Uint8List? ImgFile, String detailProject,double priceFun)async{
    bool res= await fund_controller.sendFund( userEmail: UserEmail,nameuser: nameuser, detail_project: detailProject, price_Fun: priceFun, nameFile: FileName,ImgFile: ImgFile);
    size_phone().init(context);
    if(res)
    {
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        onConfirmBtnTap: (){
          Navigator.pop(context);
        },
        text: 'تم ارسال طلب التمويل ',

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
}}