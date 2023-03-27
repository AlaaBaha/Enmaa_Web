import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class Text_Style{
  //color: Color.fromRGBO(74, 112, 122, 1.0),
TextStyle  headerP(){
    return TextStyle(
        color:Color(0xFFCDCDCD),
        fontSize: 30,
        fontFamily: 'header',
        fontWeight: FontWeight.bold,
        shadows: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(3,5),
                blurRadius: 10,
                spreadRadius: 3
            )
        ]
    );
}
TextStyle  StyleFount({required double size,required String fountFamily,required Color color ,}){
  return TextStyle(
      color:color,
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontFamily: fountFamily,
    decoration: TextDecoration.none

  );
}
TextStyle  contact_info({required Color color,required double size,required  FontWeight FontWeight, required String fontname}){
  return TextStyle(
      //Color(0xCCBB5406)
      color:color,
      fontSize:size,
      fontWeight:FontWeight,
      fontFamily: fontname

  );
}
TextStyle  content(Color color){
  return TextStyle(
      color:color,
      fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'body'

  );
}
TextStyle  contentButton(){
  return TextStyle(
    color: Color(0xE6F8B044),
    fontSize: 18,

  );
}
animationText(String text,TextStyle style){
  return AnimatedTextKit(
    repeatForever: true,
    animatedTexts: [TypewriterAnimatedText(text,textStyle: style,
        speed: Duration(milliseconds: 120),cursor: '')],);
}
}