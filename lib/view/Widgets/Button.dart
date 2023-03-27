import 'package:flutter/material.dart';
import 'package:smallmicroproduct/config/size_phone.dart';

import '../../config/Color_style.dart';
import '../../config/Text_Style.dart';
class Customer_config{
  static double shadow=0;

  size_phone size=size_phone();

  static CustomerButton(String text,Color colorBack,double hieght,double width,void Function() fun){
    return GestureDetector(
      onTap: (){
        shadow=5;
      },
      child: TextButton(
        onPressed: fun,
        child: Container(
          height:hieght,
          width: width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,0),
                    spreadRadius: shadow,
                    blurRadius: shadow


                )
              ],
              color: colorBack,
              borderRadius: BorderRadius.circular(size_phone.defualtsize!*3)
          ),
          child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontFamily: 'body',fontSize:size_phone.defualtsize!*1.3),),),
        ),),
    );
  }

}
