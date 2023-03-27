
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/Color_style.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import 'package:smallmicroproduct/controller/providerManager/keep_login.dart';
import 'package:smallmicroproduct/view/home_screen/home_screen.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import '../../controller/Auth_controller/Auth_Controller.dart';
import '../../model/Auth_Model/Auth_DB.dart';
import '../Widgets/Button.dart';
import 'login.dart';
import 'package:get/get.dart';
class login extends StatefulWidget {

  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  TextEditingController Email =TextEditingController();
  TextEditingController password =TextEditingController();
  GlobalKey<FormState> _key=GlobalKey<FormState>();
  Auth_Controller auth=Auth_Controller();
  bool downnload=false;
  bool selectBut=false;
  @override
  Widget build(BuildContext context) {
    size_phone().init(context);
    return ChangeNotifierProvider<keep_login>(
      create: (context)=>keep_login(),
      child: Stack(

        children: [
          Scaffold(
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
                          color: Color(0xFFB1C3FA),
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
                                    ))])),
                    ],
                  )
              ),
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
     ] ),
    );
  }

  Form FormLogin() {
    return  Form(
      key: _key,
      child: Column(
        children: [

          Spacer(),
          Text('  تسجيل الدخول',style: TextStyle(color: Color(0xFF011146),fontFamily: 'header',fontWeight: FontWeight.bold,fontSize: 20)),
          textfield('أدخل  الايميل', Icons.email_outlined,Email),
          textfield('أدخل  كلمة  السر', Icons.remove_red_eye_outlined,password),
          SizedBox(height: size_phone.defualtsize!*1,),
          Customer_config.CustomerButton('دخول ',Color(0xFF011146),size_phone.defualtsize!*2,size_phone.defualtsize!*10,()async{

            if(_key.currentState!.validate()){

              setState(() {
                downnload=true;
              });
          await auth.LoginAlert(context,Email.text, password.text).whenComplete(
              (){
                setState(() {
                  downnload=false;
                });
              }
          );

           }
          }),
          // Spacer(),
          // if(downnload) CircularProgressIndicator(
          //   color: colormarket,),
          Spacer(),
          Wrap(
              children: [
                Text(' ليس لديك حساب؟',style: TextStyle(fontSize: 20,fontFamily: 'body',fontWeight:FontWeight.bold,color:
                Color.fromRGBO( 1, 14, 75, 1.0)),),
                GestureDetector(  onTap: (){
                  Navigator.of(context).pushNamed('register');
                },
                    child: Text('  انشاء حساب',style:TextStyle(fontSize: 20,fontFamily: 'body',fontWeight:FontWeight.bold,color:
                Color.fromRGBO( 37, 115, 206, 1.0)),)),



              ]),
          Spacer(), ],
      ),
    );
  }
  Container textfield(String title,IconData icon,TextEditingController controller){
    return  Container(
      margin: EdgeInsets.only(bottom: size_phone.defualtsize!*1),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: true,
        obscureText:controller==Email?false:selectBut==false?true:false,
        keyboardType: controller==Email?TextInputType.text:TextInputType.visiblePassword,
          controller: controller,
          onSaved: (val){
            controller.text=val!;
          },
          validator: (val){
            if(controller==Email){
              if(Email.text.isEmpty)
                return "الحقل مطلوب";
            }
            else if(controller==password){
              if(password.text.isEmpty)
                return "الحقل مطلوب";}


          },
          decoration: InputDecoration(

              icon:IconButton(onPressed:(){setState(() {
               if(selectBut==false)
                 selectBut=true;
               else
                 selectBut=false;
              });},color:   Color.fromRGBO( 1, 14, 75, 1.0),icon: Icon(controller==Email?icon:selectBut==false&&controller==password&&controller!=Email?icon:Icons.remove_red_eye)),
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


