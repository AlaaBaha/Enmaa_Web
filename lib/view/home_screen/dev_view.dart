import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import '../../config/Color_style.dart';
import 'drawer.dart';
class dev_view extends StatefulWidget  {
  @override
  State<dev_view> createState() => _dev_viewState();
}

class _dev_viewState extends State<dev_view> with SingleTickerProviderStateMixin{
//var sizephone;
AnimationController? animationController;
Animation<double>? fadeTransition;

void initState (){
  animationController=AnimationController(vsync:this,duration: Duration(milliseconds: 1500));
  fadeTransition=Tween<double>(begin: 0,end: 1).
   animate(animationController!);
  animationController?.repeat(reverse: true);
}
@override
  void dispose() {
    // TODO: implement dispose
  animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //the intial siize phone is very importent
    size_phone().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFCF9FD),
      body: Directionality(
        textDirection:TextDirection.rtl,
        child: Stack(children: [
          //background home and defintion main function
          Container(
            height: size_phone.height!*.80,
            width: size_phone.width!,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/div/home.jpg'),
                    fit: BoxFit.fill
                )
              ),
              child:Container(
                color: Colors.black.withOpacity(.3),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                Text  ("منصة لدعم المشاريع الصغيرة والمتناهية الصِغر",style:TextStyle(
                  fontFamily: 'header',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                  )),
                  MainFunction("معا نحو مستقبل مشرق",120),
                  //MainFunction("...تسويق",160),

                  ],
                ),
              )
              ),


        ],),
      ),
    );
  }
  MainFunction(String text, int speed){
  // return  FadeTransition(
  //     opacity: fadeTransition!,
  //     child:
    return  Container(
        margin: EdgeInsets.all(size_phone.defualtsize!*1),
        child: AnimatedTextKit(
repeatForever: true,
animatedTexts: [TypewriterAnimatedText(text,textStyle:TextStyle(
    fontFamily: 'header',
    fontSize: 30,
    fontWeight: FontWeight.bold,
  color: Colors.white,
),
speed: Duration(milliseconds: speed),cursor: '')],),
     // ),
  );
  }



}
