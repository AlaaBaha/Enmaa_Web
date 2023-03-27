// ****** THIS CODE IS EDITED BY A ******


import 'package:flutter/material.dart';
import 'package:smallmicroproduct/config/Color_style.dart';
import 'package:smallmicroproduct/view/Course/detail_Of_Courses.dart';
import 'package:smallmicroproduct/view/Course/show_course.dart';

import '../../config/Name_Page.dart';
import '../../config/size_phone.dart';
import '../../controller/course/course.dart';
import '../Course/fun_Course.dart';
import '../Widgets/Button.dart';

class dev_course extends StatefulWidget {
  @override
  State<dev_course> createState() => _dev_courseState();
}

class _dev_courseState extends State<dev_course> {
  double _spread=0;
  String? AnimaCon;
  List imgs = ['images/pizza.jpg','images/corochet.jpg','images/visiability.jpg'];
   late final tansform;
  var sizephone;
  late BuildContext context;

List<String>? catalog;
@override

  @override
  Widget build(BuildContext context) {
  catalog=course().getCatlog;
this.context=context;
     sizephone=MediaQuery.of(context).size;
size_phone().init(context);
    return Material(
      child: Center(
        child: catalog!.isEmpty?
        CircularProgressIndicator(
          color: colormarket,
        ):Column(
          children: [

            Expanded(
              child: Container(
                child: GridView(
                  padding: EdgeInsets.only(left:sizephone.width<=600?80:0,right: sizephone.width<=600?80:0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:sizephone.width<=600?1:3,
                  childAspectRatio:sizephone.width<=800?0.95:sizephone.width<=1000?0.85:1.1),
                  children: [
                    for(int name=0;name<3;name++)
                     // if(catalog![name]=="")
                      CoursesCatalog(imgs[name],catalog![name])
                  ],
                ),
              ),
            ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child:Row(
                        children: [

                            Icon(Icons.arrow_back_rounded, size: 32,
                            color: colormarket,),
                          Text('للمزيد من الكورسات' , style: TextStyle(fontFamily: 'body', fontWeight: FontWeight.bold, fontSize: 30,color: colormarket)),

                        ],
                      ),
                        onPressed: () { Navigator.pushNamed(context,NamePage.show_Cources);  },),
                    ],
                  ),


          ],
        ),
      ),
    );
  }

  AnimatedContainer CoursesCatalog(String image,String? name){
    return     AnimatedContainer(
        margin: EdgeInsets.all(15),
        //transform:tansform ,
        duration: Duration(milliseconds: 500),
    decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15)
    ),
    child: MouseRegion(
        onEnter: (v){
      isEnter(name!,);
    },
    onExit: (v){
    isEnter(name!);
    },
    child:Container(
      padding:AnimaCon==name?EdgeInsets.all(10):EdgeInsets.all(0) ,
      decoration: BoxDecoration(
          color: Color_style().BoxC(),
          boxShadow: [
            BoxShadow(
                blurRadius: AnimaCon==name?10:0,
                color: Colors.white

            )
          ]
      ),
          child: Column(
            children: [
              Container(
                child: Image.asset(image,fit: BoxFit.cover,),),
              Spacer(),
              Text(name!, style: const TextStyle(fontFamily: 'body', fontSize: 22, fontWeight: FontWeight.bold, color: colormarket),),
Spacer(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Customer_config.CustomerButton("عرض", Color.fromRGBO( 1, 14, 75, 1.0),size_phone.defualtsize!*1.8,
                      size_phone.defualtsize!*7.5,() {
                        detail_Of_Courses.nameCourse=name;
              Navigator.pushNamed(context, NamePage.detail_Of_Courses);
              })
              ),
Spacer()

            ],
          ),
    ) ));
  }
  //
  isEnter(String namAni) {
    setState(() {
      AnimaCon=namAni;
    });
  }
}
