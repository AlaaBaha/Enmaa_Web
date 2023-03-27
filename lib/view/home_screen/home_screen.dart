
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import '../../config/Color_style.dart';
import '../../config/Name_Page.dart';
import '../../controller/providerManager/keep_login.dart';
import 'dev_Funding.dart';
import 'dev_Market.dart';
import 'dev_SuccessPro.dart';
import 'dev_Us.dart';
import 'dev_course.dart';
import 'dev_markting.dart';
import 'dev_view.dart';
import 'drawer.dart';
class home_screen extends StatelessWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _home_screen();
  }
}
class _home_screen extends StatefulWidget {
  const _home_screen({Key? key}) : super(key: key);

  @override
  State<_home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<_home_screen> {
  keep_login? keeplog;
  @override
  Widget build(BuildContext context) {
    keeplog=Provider.of<keep_login>(context,listen: false);
    size_phone().init(context);
    GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        textDirection: TextDirection.ltr,
        children: [

          Scaffold(
            backgroundColor:Color(0xFFFCF9FD),
            key: _scaff,
            drawer:drawer(),
            body: Directionality(
              textDirection: TextDirection.ltr,
              child: ListView(
                  children: [
                   Container(
                       height:size_phone.height,
                       child: dev_view()),
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height:size_phone.height!*.65,
                      child: dev_Funding(),),
                    Container(
                      height:size_phone.width!<=600?size_phone.height!+(size_phone.height!/2):size_phone.height!*.75,
                      child: dev_course(),),
                   SizedBox(height: 100,),
                   Focus(
                      autofocus:true,
                      child: Container(
                          height:size_phone.height!*.7,
                          child: dev_Market()),
                   ),
                    SizedBox(height: 100,),
                    Container(
                      height:size_phone.height!*.65,
                      child: dev_markting(),),
                    SizedBox(height: 100,),
                    Container(
                        height:size_phone.width!<=600?size_phone.height!*.6:size_phone.height!*.55,
                        child: dev_SuccessPro()),
                    Container(
                    //  height:size_phone.width!<=600?size_phone.height!*1.5:size_phone.height!*.65,
                        width: size_phone.width!,
                        child: dev_Us()
                      ),



                  ],

              ),
            ),
          ),
          //the bar home name website and drawer
          Positioned(
            top: 0,
            left: 0,
            width: size_phone.width,
            height: 70,
            child:   Container(
              color:Color_style().background(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(onPressed: (){
                    _scaff.currentState?.openDrawer();
                  }, child: Icon(Icons.menu,size:34,color:Colors.white),
                  ),
                  Row(

                    children: [

                      Center(
                        child: Text('منصة إنماء',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'body',
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none
                            )),
                      ),
                    ],
                  ),
                  Spacer(),
                  if( keeplog!.isLogin!=true)TextButton(
                    onPressed: (){Navigator.pushNamed(context, NamePage.login);},
                    child: Text("تسجيل دخول",style:  TextStyle(
                        fontFamily: 'body',
                        fontSize: size_phone.defualtsize!*1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none
                    ),),
                  )


                ],),
            ),
          ),
        ],
      ),
    );
  }
  int responsive(double size){
     return size<=700 ?3:1;
  }
}

