
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/size_phone.dart';

import '../../config/Color_style.dart';
import '../../controller/Auth_controller/Auth_Controller.dart';
import '../../controller/providerManager/keep_login.dart';
import '../../model/Auth_Model/Auth_DB.dart';
import '../Widgets/Button.dart';
import 'package:get/get.dart';
import 'VerficationEmail.dart';
import 'login.dart';
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);
  static  String? emai_to_verfication;
  static  String? password_to_verfication;

  @override
  State<register> createState() => registerState();
}

class registerState extends State<register> {
  bool select=false;
  bool downnload=false;
  String validEmail= '^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)\$';
  TextEditingController Email =TextEditingController();
  TextEditingController password =TextEditingController();
  TextEditingController passwordRet =TextEditingController();
  GlobalKey<FormState> _key=GlobalKey<FormState>();
  Auth_Controller auth=Auth_Controller();


  @override
  Widget build(BuildContext context) {
    size_phone().init(context);
    var sizephone=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
              margin:EdgeInsets.only(left:size_phone.width!<=800?size_phone.defualtsize!*5:0
                  ,right:size_phone.width!<=800?size_phone.defualtsize!*5:0 ),

              decoration: BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFF0F3FC),
                      //offset: Offset(3,3),
                      blurRadius: 5,
                      spreadRadius: 5
                  )
                ],

              ),
              height:size_phone.width!>500?size_phone.defualtsize!*30:size_phone.defualtsize!*35,
              width: size_phone.width!>500?size_phone.defualtsize!*45:size_phone.defualtsize!*40,
              child: Row(
                children: [
                  if(size_phone.width!>600)
                    Flexible(
                        flex:1,
                        child: Column(children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(size_phone.defualtsize!*20)),
                                image: DecorationImage(
                                  image: AssetImage('images/login.webp',),
                                  fit: BoxFit.cover,
                                )
                            ),
                            height: size_phone.defualtsize!*30,
                            width: size_phone.defualtsize!*30,
                          )],)),
                  Flexible(
                      flex: 1,
                      child: Column(
                          children: [
                            Container(
                                height: size_phone.defualtsize!*30,
                                width: size_phone.defualtsize!*30,
                                child: InkWell(
                                  child:Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Container(
                                        margin: EdgeInsets.only(right:size_phone.defualtsize!*3
                                            ,left:size_phone.defualtsize!*3),
                                        child:FormLogin()
                                    ),
                                  ),
                                )),
                          ]
                      ))
                  ,

                ],
              )
          ),
        ),
      ),
    );
  }


  Form FormLogin() {
    keep_login keeplog=Provider.of<keep_login>(context);
    return  Form(
      key: _key,
      child: Column(
        children: [
          Spacer(),
          Text('  انشاء حساب',style: TextStyle(color: Color(0xFF011146),fontFamily: 'header',fontWeight: FontWeight.bold,fontSize: 20)),
          textfield('أدخل  ايميلك', Icons.email_outlined,Email),
          textfield('أدخل  كلمة  سرك', Icons.remove_red_eye_outlined,password),
          textfield('اعد أدخال كلمة سرك', Icons.remove_red_eye_outlined,passwordRet),
          Spacer(),
          Customer_config.CustomerButton('انشاء ',Color(0xFF011146),size_phone.defualtsize!*2,size_phone.defualtsize!*10,(){
            if(_key.currentState!.validate()){
             register. emai_to_verfication=Email.text;
             register. password_to_verfication=password.text;
             Auth_Controller().VerficationnewEmail(context,Email.text);
            }}),
       Spacer(),
           Wrap(
                children: [
                  Text(' لديك حساب؟',style: TextStyle(fontSize: 20,fontFamily: 'body',fontWeight:FontWeight.bold,color:
           Color.fromRGBO( 1, 14, 75, 1.0) ),),
                  GestureDetector(
                      onTap: (){Navigator.of(context).pushNamed('login');}, child:
                  Text('تسحيل دخول ',style:TextStyle(fontSize: 20,fontFamily: 'body',fontWeight:FontWeight.bold,color:
                  Color.fromRGBO( 37, 115, 206, 1.0)),)),





                ]),
          Spacer(),

        ],
      ),
    );
  }
  Container textfield(String title,IconData icon,TextEditingController controller){
    return  Container(
      margin: EdgeInsets.only(bottom: size_phone.defualtsize!*1),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofocus: true,
          obscureText:controller==Email?false:true,
          keyboardType: controller==Email?TextInputType.text:TextInputType.visiblePassword,
        controller: controller,
          onSaved: (val){
          controller.text=val!;
          },
          validator: (val){
          if(controller==Email){
            if(Email.text.isEmpty)
              return "الحقل مطلوب";
            else if(!RegExp(validEmail).hasMatch(Email.text))
              return "يجب ان يكون بصيغة a@gmail.com";
          }
          else if(controller==password){
            if(password.text.isEmpty)
              return "الحقل مطلوب";
            else if(password.text.length!=6&&password.text.isNumericOnly)
              return "يجب ان تحتوي على 6 ارقام ";
          }
          else if(controller==passwordRet){
            if(passwordRet.text.isEmpty)
              return "الحقل مطلوب";
            else
            if(passwordRet.text!=password.text)
              return "غير مطابقة";
          }


          },
          decoration: InputDecoration(
            prefixIcon:Icon(color:   Color.fromRGBO( 1, 14, 75, 1.0),icon),
            hintText: title,
            hintStyle: TextStyle(fontSize: 20,fontFamily: 'body',fontWeight:FontWeight.bold,color:
            Color.fromRGBO( 1, 14, 75, 1.0)),
            focusColor: Color.fromRGBO(6, 63, 150, 1.0),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:   Color.fromRGBO( 1, 14, 75, 1.0)
              )
            )

          )
      ),
    );
  }
}


