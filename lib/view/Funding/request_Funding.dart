import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:smallmicroproduct/controller/Fund_controller/Fund_controller.dart';
import 'package:smallmicroproduct/view/Widgets/Button.dart';
import 'package:smallmicroproduct/view/Widgets/appBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../config/Color_style.dart';
import '../../config/size_phone.dart';
import '../home_screen/drawer.dart';
class request_Funding extends StatefulWidget {
  const request_Funding({Key? key}) : super(key: key);

  @override
  State<request_Funding> createState() => _request_Funding();
}

class _request_Funding extends State<request_Funding> {
  bool downnload=false;
FirebaseAuth _auth=FirebaseAuth.instance;
  GlobalKey<FormState> _key=GlobalKey();
  TextEditingController nameuser=TextEditingController();
  TextEditingController prov_user=TextEditingController();
  TextEditingController detail_project=TextEditingController();
  TextEditingController price_Fun=TextEditingController();
  FilePickerResult? file;
  PlatformFile? ImagInf;
  Fund_controller fund_controller=Fund_controller();
String? userEmail;
    GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
    @override
    //the design market request
    Widget build(BuildContext context) {
      size_phone().init(context);
      userEmail=_auth.currentUser!.email;
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
          Scaffold(
          key: _scaff,
          drawer: drawer(),
          appBar: appBar.AppBarCourses('', context, _scaff),
          backgroundColor: Theme.of(context).backgroundColor,
          body:  Container(
            margin:EdgeInsets.only(top: size_phone.defualtsize!*4,bottom: size_phone.defualtsize!*4,
                right:size_phone.width!<900?size_phone.defualtsize!*5:size_phone.defualtsize!*11 ,
                left:size_phone.defualtsize!*4  ),

            child: Row(
              //the size is phone the image not show
              children: [
                //form market
                Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                            color: Colors.black12,
                            offset: Offset(-10,-10),
                            blurRadius: 20

                        )],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft:size_phone.width!>800? Radius.circular(0): Radius.circular(size_phone.defualtsize!*2.5),
                            bottomLeft: size_phone.width!>800? Radius.circular(0): Radius.circular(size_phone.defualtsize!*2.5),
                            topRight:  Radius.circular(size_phone.defualtsize!*2.5),bottomRight:  Radius.circular(size_phone.defualtsize!*2.5)

                        ))  ,height: size_phone.height,
                    width:size_phone.width!>800? size_phone.width!/3:size_phone.width!/1.55,
                    padding: EdgeInsets.only(left:size_phone.defualtsize!*2,right: size_phone.defualtsize!*2 ),
                    child: Form_Fund()),
                if(size_phone.width!>=800)...{
                  Column(children: [
                    Expanded(
                      child: Container(
                        width: size_phone.width!/3,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                                offset: Offset(-10,-10),
                                blurRadius: 20

                            )],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(size_phone.defualtsize!*2.5),bottomLeft: Radius.circular(size_phone.defualtsize!*2.5)),
                            image: DecorationImage(
                                image: AssetImage('images/Request_Market.jpg'),fit: BoxFit.cover
                            )
                        ),
                      ),
                    )
                  ],)
                },



              ],
            ),

          ),

        ),
            if(downnload)  Container(
                color: Colors.grey.withOpacity(.1),
                height: size_phone.height,
                width: size_phone.width,
                child:LoadingOverlayPro(
                    progressIndicator: LoadingBouncingLine.circle(
                      backgroundColor: Colors.white,
                      borderColor: Colors.white,
                    ),
                    isLoading: downnload, child: Text('')
                )
            ),
          ],
        ),
      );
  }
   Form_Fund(){
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: size_phone.defualtsize!*.7,),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [TypewriterAnimatedText('أطلب تمويل',textStyle: TextStyle(color:colormarket,fontFamily: 'header',fontSize: 22,fontWeight: FontWeight.bold),
                    speed: Duration(milliseconds: 100),cursor: '')],),
              textfield('أدخل اسمك رباعيًا', Icon(Icons.person),nameuser),

              SizedBox(height: size_phone.defualtsize!*.7,),
              Row(
                children: [
                  Expanded(
                    child: textfield(prov_user.text!=''?prov_user.text!:'ادخل اثبات الششخصية',Icon(Icons.camera),prov_user),
                  ),
                  SizedBox(height: size_phone.defualtsize!*.7,),
                  Container(
                      margin: EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        color: colormarket,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(onPressed: selectFile,style: ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.only(left: 11,right: 11,top: 13,bottom: 13))),
                          child: Text('اختار',style: TextStyle(fontSize: 25,color: Colors.white, fontFamily: "body"),)
                      )),
                ],
              ),

              SizedBox(height: size_phone.defualtsize!*.7,),
              textfield("أدخل نبذة مختصرة عن مشروعك", Icon(Icons.details),detail_project),
              SizedBox(height: size_phone.defualtsize!*.7,),
              textfield("أدخل المبلغ مشروعك", Icon(Icons.attach_money_outlined),price_Fun),
              SizedBox(height: size_phone.defualtsize!*.7,),
              Customer_config.CustomerButton('إرسال', colormarket, size_phone.defualtsize!*2, size_phone.defualtsize!*5,
                      () {
                        if(_key.currentState!.validate()){
                          setState(() {
                            downnload=true;
                          });
                          fund_controller.RequestFundControl(context,userEmail!,nameuser.text,ImagInf!.name,ImagInf!.bytes,detail_project.text,
                              double.parse(price_Fun.text)).whenComplete(() {
                            setState(() {
                              downnload=false;
                              nameuser.text="";
                              prov_user.text="";
                              detail_project.text="";
                              price_Fun.text="";
                            });
                          });

                        };
                      })
            ],
          ),
        ),
      ),
    );
  }
  Container textfield(String title,Icon icon,TextEditingController control){
    return  Container(
      child: Directionality(
        textDirection:TextDirection.rtl,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: control,
            validator: (val){
              final numericRegex =
              RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
            if(title=="أدخل المبلغ مشروعك"&&val!.isNotEmpty&&!numericRegex.hasMatch(val!))
              return 'ادخل قيمة عددية';
            else if((control==nameuser||control==detail_project)&&val!.isNum)
              return 'لا تدخل رقم';
            else if(val!.isEmpty)
              return 'الحقل مطلوب';

            }
              ,
            onSaved: (val){
            control.text=val!;
            },
          keyboardType:title=="أدخل نبذة مختصرة عن مشروعك"?TextInputType.multiline:TextInputType.text,
            maxLines: title=="أدخل نبذة مختصرة عن مشروعك"?4:1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: icon,
              hintStyle: TextStyle(fontFamily:'body',fontSize: 22,color:Colors.grey,),
              hintText: title,
              enabledBorder:bord(),
              disabledBorder:bord(),
              border: bord(),
              focusedBorder: bord(),
              focusColor: Color.fromRGBO(232, 152, 115, 1.0),

            )
        ),
      ),
    );
  }
  Future<void> selectFile()async{
    FilePickerResult? _filePickerResult;

    try {
      _filePickerResult = await FilePicker.platform.pickFiles(
        allowedExtensions: ['jpg','png','jpeg','pdf'],
        type: FileType.custom,);
      if (_filePickerResult != null) {
        ImagInf=_filePickerResult.files.single;
        setState(() {
          prov_user.text = _filePickerResult!.files.single.name;
          file= _filePickerResult;
          Uint8List? uploader =ImagInf!.bytes;

        });

      }

    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }

  }
  OutlineInputBorder bord(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Color.fromRGBO(142, 152, 152, 1.0),
        )
    );
  }
  BoxShadow _shadow(){
    return BoxShadow(
        blurRadius: 10,
        spreadRadius: .1,
        color: Colors.grey.withOpacity(.5),
        offset: Offset(-20,3)
    );
  }}
