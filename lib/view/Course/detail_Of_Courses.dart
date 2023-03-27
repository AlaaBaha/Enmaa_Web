import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../config/Color_style.dart';
import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';
import '../../controller/course/course.dart';
import '../../model/courses/courseDetail.dart';
import '../../model/courses/courses.dart';
import '../home_screen/drawer.dart';
import 'fun_Course.dart';
import '../../view/Widgets/appBar.dart';

class detail_Of_Courses extends StatelessWidget {
  fun_Course FunCourse=fun_Course();
  static String route="/Detail_Courses";
  static String? nameCourse;
  courses cor=courses();
TextEditingController controlsearch=TextEditingController();
String searchitem='';
  @override
  Widget build(BuildContext context) {
    size_phone().init(context);
    GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          key: _scaff,
          drawer: drawer(),
      appBar: appBar.AppBarCourses('${detail_Of_Courses.nameCourse}  ',context,_scaff),
          body: detail_Of_Courses.nameCourse==null?
              Container():
          FutureBuilder(
           future:courses().getALLCourse(detail_Of_Courses.nameCourse!),
              builder: (context,snapshot){
             if(snapshot.connectionState==ConnectionState.waiting&&!snapshot.hasData)
              {
               return Center(child: CircularProgressIndicator(  strokeWidth: 6,
                 color: Color.fromRGBO(2, 19, 79, 1.0),),);}
                  else
                      return GridView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                           var data=snapshot.data![index];
                          return FunCourse.box_course(
                              context: context,
                              nameCourse:data!.name,
                              link: data.link,
                              image: data.image);
                  },

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: show(size_phone.width!), childAspectRatio: .75),
              );


          }

          )),
    );
  }




  int show(double size) {
    if (size <= 700)
      return 2;
    else if (size > 700 && size <= 900)
      return 3;
    else if (size > 900 && size <= 1100)
      return 4;
    else
      return 5;
  }


}
