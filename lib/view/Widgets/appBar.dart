import 'package:flutter/material.dart';
import '../../config/Color_style.dart';
import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';

 class appBar{
  static AppBar AppBarCourses(String text,BuildContext context,_scaff){
    size_phone().init(context);

    return AppBar(
        leading: Directionality(
          textDirection:TextDirection.rtl,
          child:IconButton(
            onPressed: (){
              _scaff.currentState?.openDrawer();
            }, icon: Icon(Icons.menu,size:size_phone.defualtsize!*1.5,color:Colors.white),
          ),
        ),
        backgroundColor:colormarket,
        title:  Text(text, style: Text_Style().StyleFount(size: 30, fountFamily: "header", color: Colors.white),),
        centerTitle: true,

    );
  }
}