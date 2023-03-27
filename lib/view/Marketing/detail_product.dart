import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:circular_progress_bar/circular_progress_bar.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/Text_Style.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import '../../view/Widgets/appBar.dart';
import '../../config/Color_style.dart';
import '../../controller/market/market_Controller.dart';
import '../../controller/providerManager/specific_Show_product.dart';
import '../Widgets/Button.dart';
import '../home_screen/drawer.dart';
//the calss explain the detail of product

class detail_product extends StatefulWidget {
  String? argment;

  detail_product(this.argment);

  @override
  State<detail_product> createState() => _detail_productState();
}

class _detail_productState extends State<detail_product> {
  String pattren= r'^(?:[+0]9)?[0-9]{10}$';
  market_Controller _market = market_Controller();
TextEditingController choose=TextEditingController();
  specific_Show_product? show_product;
GlobalKey<FormState> key=GlobalKey<FormState>();
  PlatformFile? ImagInf;
  FilePickerResult? file;
  bool download=false;
  @override
  Widget build(BuildContext context) {

    size_phone().init(context);
    show_product = Provider.of<specific_Show_product>(context, listen: false);
    size_phone().init(context);
    GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaff,
        drawer: drawer(),
        appBar: appBar.AppBarCourses('',context,_scaff),
        body: Center(
            child: StreamBuilder(
                stream: market_Controller().getDetailProdduct(widget.argment!),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final info = snapshot.data?.docs[0];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            height: size_phone.height! / 3,
                            width: size_phone.defualtsize! * 20,
                            child:download==true?Center(child: CircularProgressIndicator(
                              color: colormarket,
                              strokeWidth: 3,
                            )): Image.network(
                                info.get('ImgPath'), fit: BoxFit.cover),
                          ),
                          Container(
                          //padding: EdgeInsets.all(size_phone.defualtsize!*2),
                          width: size_phone.defualtsize!*20,
                          height: size_phone.defualtsize!*16,
                          decoration: BoxDecoration(
                          color: Colors.white,
                              boxShadow: [BoxShadow(
                                  offset: Offset(3,3),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  color:  Color.fromRGBO( 156, 165, 248, 1.0)
                              )]),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if( show_product!.show_product == "Me") TextButton(onPressed: ()async{
                                    selectFile().whenComplete(() async{
                                      setState(() {
                                        download=true;
                                      });
                                      await  _market.UpdateImage('ImgPath',choose.text,ImagInf!.bytes,widget!.argment).
                                      whenComplete(() {
                                          setState((){
                                      choose.text='';
                                      download=false;
                                      });});
                                    }
                                   );
                                  }, child: Text('تغير صورة المنتج',
                                    style: Text_Style().StyleFount(size: 20, fountFamily: 'body', color: Colors.grey),)),
                                  Spacer(),
                                  item("اسم المنتج:   ${info.get('namePro')}","namePro"),
                                  item("تصنيف المنتج:   ${info.get('Catalog')}","Catalog"),
                                  item('سعر المنتج:   ${info.get('price')}','price'),
                                  item('موقع المنتج:    ${info.get('describe')}','describe'),
                                  item('رقم المالك:   0${info.get('Phone')}','Phone'),
                                  Spacer(),
                                  show_product!.show_product == "Me" ? Align(
                                    alignment: Alignment.center,
                                    child: ButtonUserProduct(),) : Text(''),
                                  Spacer()

                                ],
                              ),
                            ),
                          )
                        ],),
                    );
                  }
                  else {
                    return CircularProgressIndicator(   strokeWidth: 6,
                      color: Color.fromRGBO(2, 19, 79, 1.0),);
                  }
                }
            )
        ),
      ),
    );
  }

//the detail of product can be retrive
   item(String text,String keyList) {
    return Row(
      children: [
        Spacer(),
        Text(text, style:Text_Style().StyleFount(size: 25, fountFamily: 'body', color: colormarket)),

        if( show_product!.show_product == "Me")...
         {
           Spacer(),
           TextButton(onPressed: (){
             showDialog(context: context, builder:(context){
               return AlertDialog(
                 content: Form(
                   key: key,
                   child: Directionality(
                     textDirection: TextDirection.rtl,
                     child: TextFormField(
                       controller: choose,
                       onSaved: (val){
                         setState(() {
                           choose.text=val!;
                         });
                       },
                       validator:keyList=='Phone'? (val){
                         RegExp regex=RegExp(pattren);
                         if(val!.isEmpty){ return 'الحقل مطلوب';}
                         else if(!regex.hasMatch(val!)){
                           return 'رقم التواصل غير صحيح';
                         }
                       }:keyList=='price'?
                           (val){
                         final numericRegex =
                         RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
                         if(val!.isEmpty){ return 'الحقل مطلوب';}
                         if(!numericRegex.hasMatch(val!)){
                           return 'ادخل قيمة صحيحة';
                         }
                       }:(val){
                         if(val!.isEmpty){
                           return 'الحقل مطلوب';
                         }
                       },
                     ),
                   ),
                 ),
                 actions: [
                   Row(
                     children: [
                       TextButton(onPressed: ()async {
                         if(key.currentState!.validate()){
                           keyList=='price'?{
                             await  _market.EditProduct(keyList, int.parse(choose.text), widget.argment)
                           }
                               :await  _market.EditProduct(keyList, choose.text, widget.argment);
                           setState(() {
                             choose.text='';
                           });
                           Navigator.pop(context);
                         }
                       }, child: Text("تعديل",style: Text_Style().StyleFount(size: 20, fountFamily: 'body', color: secoundOrigin),)),
                       TextButton(onPressed: ()async {

                           Navigator.pop(context);

                       }, child: Text("الغاء",style: Text_Style().StyleFount(size: 20, fountFamily: 'body', color: secoundOrigin),))
                     ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   )
                 ],
               );
             });

           }, child: Icon(Icons.edit,size: 15,color: Colors.grey,)),
         },
        if( show_product!.show_product != "Me") Spacer(),
      ],
    );
  }

  List<BoxShadow> _shadow() {
    return [BoxShadow(
      blurRadius: 10,
      offset: Offset(-3, 0),
      color: Color.fromRGBO(7, 31, 75, 1.0),
    )
    ];
  }

  ButtonUserProduct() {
    return Row(mainAxisAlignment:MainAxisAlignment.center,
      children: [

        Customer_config.CustomerButton(
          'حذف ', Color(0xFF565656), size_phone.defualtsize! * 2,
          size_phone.defualtsize! * 4.5, () {
      _market.DeletProduct(widget.argment!, context);},)


    ],);
  }
  Future<void> selectFile()async{
    FilePickerResult? _filePickerResult;

    try {
      _filePickerResult = await FilePicker.platform.pickFiles(
        allowedExtensions: ['jpg','png','jpeg','jfif'],
        type: FileType.custom,);
      if (_filePickerResult != null) {
        ImagInf=_filePickerResult.files.single;
        setState(() {
          choose.text=_filePickerResult!.files.single.name;
          file= _filePickerResult;
          Uint8List? uploader =ImagInf!.bytes;

        });

      }

    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }

  }
}