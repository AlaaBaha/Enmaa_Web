
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/size_phone.dart';

import '../../config/Color_style.dart';
import '../../controller/Auth_controller/Auth_Controller.dart';
import '../../controller/providerManager/specific_Show_product.dart';
import '../Widgets/Button.dart';
import '../home_screen/drawer.dart';
import '../home_screen/home_screen.dart';
import '../../view/Widgets/appBar.dart';
import '../login/register.dart';
class profile extends StatefulWidget {
  profile( {Key? key}) : super(key: key);

  @override
  State<profile> createState() => profileState();
}

class profileState extends State<profile> {
  GlobalKey<FormState> _key=GlobalKey<FormState>();
FirebaseAuth Auth=FirebaseAuth.instance;
String? email;
String? password;
  specific_Show_product? show_product;
  GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    email=register.emai_to_verfication;
    show_product=Provider.of<specific_Show_product>(context,listen: false);}
  @override
  Widget build(BuildContext context) {
    size_phone().init(context);

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            key: _scaff,
            drawer: drawer(),
            appBar: appBar.AppBarCourses(' ',context,_scaff),
            body: Center(
                    child: Container(
                        padding: EdgeInsets.all(size_phone.defualtsize!*2),
                        width: size_phone.defualtsize!*20,
                        height: size_phone.defualtsize!*30,
                        child:FormVerification(),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                                offset: Offset(3,3),
                                spreadRadius: 1,
                                blurRadius: 10,
                                color:  Color.fromRGBO( 156, 165, 248, 1.0)
                            )]
      ))

      ),
    ));
  }
  FormVerification(){

    return  Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
          CircleAvatar(maxRadius:size_phone.defualtsize!*2.5,backgroundColor: colorOrigin,
            child: Center(child:Icon(Icons.person,color: Colors.white,size: size_phone.defualtsize!*5,),)),
          TextFormField(
            enabled: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: email,
                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: colorOrigin),
                border: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white,width: 0)
                ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 0)
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 0)
              ),
            ),
          ),
          Spacer(),
          Customer_config.CustomerButton('منتجاتي ',Color(0xFF011146),size_phone.defualtsize!*2.5,size_phone.defualtsize!*10,(){
            show_product!.setProduct("Me");
            Navigator.pushNamed(context, "show_Product");
          }),
          Spacer(),
          Customer_config.CustomerButton('حذف الحساب ',Color(0xFF011146),size_phone.defualtsize!*2.5,size_phone.defualtsize!*10,()async{
           await Auth_Controller().DeletAccountAlert(context,email!);
           }
          ),
          Spacer(),
        ],
      ),
    );
  }
}

