import 'package:flutter/material.dart';
import 'package:smallmicroproduct/config/Color_style.dart';
import 'package:smallmicroproduct/config/Text_Style.dart';

import '../../config/Name_Page.dart';
import '../../config/size_phone.dart';
import '../../controller/course/course.dart';
import '../home_screen/drawer.dart';
import '../../view/Widgets/appBar.dart';
import 'detail_Of_Courses.dart';
class show_cource extends StatelessWidget {
   show_cource({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      size_phone().init(context);
      GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
             key: _scaff,
              drawer: drawer(),
              appBar: appBar.AppBarCourses('الكورسات المعروضة',context,_scaff),
              body:Center(
                child: StreamBuilder(
                  stream: course().getAllCatlog,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData)
                      return ListCourse(snapshot);
                    else
                      return Center(
                          child:
                          CircularProgressIndicator(
                            strokeWidth: 6,
                            color: Color.fromRGBO(2, 19, 79, 1.0),
                          ));

                  },
                ),
              )


        ),
      );}

ListCourse(snapshot){

 return
   Directionality(
     textDirection: TextDirection.ltr,
     child: Container(
       height: size_phone.defualtsize!*33 ,
       width:  size_phone.defualtsize!*25,
       child: Card(
         shadowColor: colormarket.withOpacity(.5),
         child: ListView.builder(
           itemCount:course().getCatlog.length,
             itemBuilder: (BuildContext context,index){
             List<String> temp=course().getCatlog;
              return nameCourse(temp[index],context);
             }),
       ),
     ),
   );}

    nameCourse(String name,context){
      return  Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: EdgeInsets.only(bottom:size_phone.defualtsize!*.5,),
          padding: EdgeInsets.all(size_phone.defualtsize!*1,),
          color: Colors.grey.withOpacity(.2),
          child: Padding(
            padding:  EdgeInsets.only(right: size_phone.defualtsize!*1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      detail_Of_Courses.nameCourse=name;

                    Navigator.pushNamed(context,  NamePage.detail_Of_Courses);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_sharp,color: colormarket,)),
                    Text(name,style: Text_Style().StyleFount(size: size_phone.defualtsize!*1.5, fountFamily: "body", color: colormarket),),

                  ],
                ),

              ],
            ),
          ),
        ),
      );
    }
}