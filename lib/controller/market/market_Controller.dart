import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/size_phone.dart';

import '../../config/Color_style.dart';
import '../../config/Name_Page.dart';
import '../../config/Text_Style.dart';
import '../../model/MarketModel/MarketModel.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import '../providerManager/specific_Show_product.dart';

class market_Controller{
  MarketModel marketModel=MarketModel();
  List<String> getCatlog= MarketModel().Cataloger();
  specific_Show_product? show_product;
  insertProuduct(BuildContext context,String nameFile, String namePro, Uint8List? ImgPath, String Catalog, double price, String describe, int Phone) async{
    bool res=await marketModel.insertDB(nameFile, namePro, ImgPath, Catalog, price, describe, Phone);
     size_phone().init(context);
if(res)
  {
    show_product=Provider.of<specific_Show_product>(context,listen: false);
    await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        onConfirmBtnTap: (){
            show_product!.setProduct('All');
            Navigator.pushNamed(context, "show_Product");
        },
  text: 'المنتج اضيف بنجاح',

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
  Stream<QuerySnapshot<Map<String, dynamic>>> getDetailProdduct(String id){
    return marketModel.getDetailProdduct(id);
  }
  Future<void> DeletProduct(String id,BuildContext context)async{
    size_phone().init(context);
    bool val;
    CoolAlert.show(
      confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
      onConfirmBtnTap: ()async{
        Get.toNamed(NamePage.show_Product);
        val=await deleteDB(id);
        requestVerfication(val!,context);} ,
      backgroundColor:colormarket,
      confirmBtnColor: colormarket,
      title: "",
      confirmBtnText: "موافق",
      width: 100,
      context: context,
      type: CoolAlertType.warning,
      text: "هل تريد مسح المنتج",
    );

  }
  void requestVerfication(bool val,BuildContext context) {
    if(val)
    {
      CoolAlert.show(

        confirmBtnTextStyle: Text_Style().StyleFount(size: 20, fountFamily: "body", color: Colors.white),
        onConfirmBtnTap: (){
          Navigator.pushNamed(context, 'show_Product');} ,
        backgroundColor:colorOrigin,
        width: 100,
        context: context,
        type: CoolAlertType.success,
        text: " تم حذف المنتج ",
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
        text: "فشل  حذف المنتج ",
      );
  }
   EditProduct(String key, dynamic value, String? argment)async {
     try {
       bool val= await marketModel.UpdateProduct( key,value, argment);

       return true;
     }
     catch(e){
       return false;
     }

  }

  UpdateImage(String key, String text, Uint8List? bytes,String? id) async{
    try {
      var val= await marketModel.UpdateImage(key,text,bytes,id!);

      return true;
    }
    catch(e){
      return false;
    }

  }

  Future<bool> deleteDB(String id)async {
try {
  bool val=await marketModel.deleteProduct(id);
  return true;
}
catch(e){
  return false;
}
}
  }
