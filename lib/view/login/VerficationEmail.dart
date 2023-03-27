import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import 'package:smallmicroproduct/view/login/register.dart';
import '../../config/Color_style.dart';
import '../../config/Text_Style.dart';
import '../../controller/Auth_controller/verficatin_Controller.dart';
import '../../controller/providerManager/keep_login.dart';
import '../../model/Auth_Model/verficationEmail.dart';
import '../Widgets/Button.dart';
class VerficationEmail extends StatefulWidget {
  VerficationEmail( {Key? key}) : super(key: key);

  @override
  State<VerficationEmail> createState() => _VerficationEmailState();
}

class _VerficationEmailState extends State<VerficationEmail> {
    int? otp;
bool isEmailVerfication =false;
final  _auth=FirebaseAuth.instance;
TextEditingController otp2=TextEditingController();
    verfication_controller send=verfication_controller();
    GlobalKey<FormState> _key=GlobalKey<FormState>();
     String? email;
     String? password;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   emailsender();
  }
    emailsender()async{
  email=register.emai_to_verfication;
  password=register.password_to_verfication;
       print(email);
      if (email != null)
        await send.VeriFicationEmail(email).then((value) =>
            setState(() {
              isEmailVerfication = true;
            }));
    }
  @override
  Widget build(BuildContext context) {

  size_phone().init(context);
    return Scaffold(
      body: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (isEmailVerfication==true) {
            return Center(
              child: Container(
                padding: EdgeInsets.all(size_phone.defualtsize!*2),
                width: size_phone.defualtsize!*20,
                height: size_phone.defualtsize!*25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    offset: Offset(3,3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    color:  Color.fromRGBO( 156, 165, 248, 1.0)
                  )]
                ),
                child:FormVerification()

              ),
            );
          }
          else
            return Center(
                child:Container(
              color: Colors.grey.withOpacity(.1),
              height: size_phone.height,
              width: size_phone.width,
              child:LoadingOverlayPro(
                  progressIndicator: LoadingBouncingLine.circle(
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                  ),
                  isLoading: true, child: Text('')
              )
          ),);
        })


    );
  }
  FormVerification(){
  return  Form(
    key: _key,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Spacer(),
    Text('قم بادخال رمز التحقق الرسل',style: Text_Style().StyleFount(size: 20, fountFamily: "body", color: colormarket),),

      Center(child: Text('في بريدك الالكتروني',style: Text_Style().StyleFount(size: 20, fountFamily: "body", color: colormarket),)),
    SizedBox(height: 10,),
    Center(
    child: TextFormField(
textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: '--- ---',
    hintStyle: TextStyle(fontWeight: FontWeight.bold),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20)
    )
    ),
    controller:otp2 ,
    onSaved: (val){
    otp2.text=val!;
    print( otp2.text);
    },
validator: (val){
     if(otp2.text!.isEmpty)
       return 'الحقل مطلوب';
},
    ),
    ),
      SizedBox(height: 20,),
    Customer_config.CustomerButton('ارسال',colormarket,size_phone.defualtsize!*2.5,size_phone.defualtsize!*4,(){  if(_key.currentState!.validate()){
      send.getOtpfromdata(context,  email!,password!, int.parse(otp2.text));}}),
      Spacer(),
      ],
      ),
  );
}
}

