import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import 'package:smallmicroproduct/controller/providerManager/keep_login.dart';
import 'package:smallmicroproduct/view/Course/show_course.dart';
import '../../config/Color_style.dart';
import '../../config/Name_Page.dart';
import '../../controller/Auth_controller/Auth_Controller.dart';
import '../../controller/providerManager/specific_Show_product.dart';
import 'package:smallmicroproduct/view/home_screen/home_screen.dart';

class drawer extends StatefulWidget {
   drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  keep_login? keeplog;
  specific_Show_product? show_product;
  @override
  Widget build(BuildContext context) {
    size_phone().init(context);
     keeplog=Provider.of<keep_login>(context,listen: false);
    show_product=Provider.of<specific_Show_product>(context,listen: false);
    return  Drawer(
        width:size_phone.width!<= 600?size_phone.defualtsize!*18: size_phone.defualtsize!*12.5,
        //the color in config file
        backgroundColor: colormarket,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                  child: IconButton(onPressed: () {Scaffold.of(context).closeDrawer();},icon: Icon(Icons.close, color: colorDrawer,size: size_phone.defualtsize!*2,),)),
             //Home
              pageRoute(context,NamePage.Home,Icons.home,'الرئيسية'),
              SizedBox(height: size_phone.defualtsize!*0.7,),
              pageRoute(context,NamePage.funding,Icons.monetization_on,'طلب تمويل'),
              SizedBox(height: size_phone.defualtsize!*0.7,),
              //training page
              pageRoute(context,NamePage.show_Cources,Icons.widgets,'كورسات التدريب'),
              SizedBox(height: size_phone.defualtsize!*0.7,),

              //training request
              pageRoute(context,NamePage.request_trainig,Icons.person_add_alt_rounded,'طلب كورس تدريب'),
              SizedBox(height: size_phone.defualtsize!*0.7,),
              //show product
              pageRoute(context,NamePage.show_Product,Icons.local_grocery_store,'المنتجات المسوقة'),
              SizedBox(height: size_phone.defualtsize!*0.7,),
              //request market
              pageRoute(context,NamePage.Marketed,Icons.add_shopping_cart,'سوّق منتجك'),
              SizedBox(height: size_phone.defualtsize!*0.7,),
              //request Profil
              if(keeplog!.isLogin==true)...{
                pageRoute(context,NamePage.profile,Icons.person,'حسابي'),
              SizedBox(height: size_phone.defualtsize!*0.7,),},
               //request Us
              pageRoute(context,NamePage.Us,Icons.info,'من نحن'),
              SizedBox(height: size_phone.defualtsize!*0.7,),
              //request SignOut
              if( keeplog!.isLogin==true)...{pageRoute(context,'SignOut',Icons.logout,'تسجيل خروج'),
              SizedBox(height: size_phone.defualtsize!*0.7,),}
            ],
          ),
        ),
      );
  }

  pageRoute(BuildContext context,String pageName,IconData icon,String trainling){
    Color color=Colors.white;
    String? select;
    return    InkWell(
      focusColor: Colors.white,
      child: GestureDetector(
        onTap: (){
          }, child: ListTile(
        onTap: (){
          setState((){
          select=trainling;
        });
          keeplog!.isLogin==false&&pageName!=NamePage.Us&&pageName!=NamePage.show_Product&&pageName!=NamePage.show_Cources
            &&pageName!=NamePage.Home?
        Navigator.pushNamed(context, NamePage.login):
        pageName==NamePage.show_Product?setState((){
          show_product!.setProduct('All');
          Navigator.pushNamed(context, pageName);
        }):pageName!=NamePage.SignOut?Navigator.pushNamed(context, pageName): Auth_Controller().LogoutAlert(context);
        },
        selected: true,
        selectedColor: color,
        leading : Icon(icon,size: 22, color: Colors.white,),
        title :Text(trainling,style: TextStyle(fontFamily: 'body',fontSize: 22,
            color: Colors.white),) ,),),
    );
  }
}
