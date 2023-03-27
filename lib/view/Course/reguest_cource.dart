import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:smallmicroproduct/controller/course/course.dart';
import 'package:smallmicroproduct/model/Auth_Model/Auth_DB.dart';
import 'package:smallmicroproduct/view/Widgets/appBar.dart';
import '../../config/Color_style.dart';
import '../../config/size_phone.dart';
import '../Widgets/Button.dart';
import '../home_screen/drawer.dart';
import 'fun_Course.dart';
import 'package:smallmicroproduct/view/Widgets/appBar.dart';
class reguest_course extends StatefulWidget {
  const reguest_course({Key? key}) : super(key: key);

  @override
  State<reguest_course> createState() => _reguest_courseState();
}

class _reguest_courseState extends State<reguest_course> {
  GlobalKey<FormState> _key=GlobalKey();
  fun_Course Fun_Course=fun_Course();
  course courseControl=course();
  List<String>? catalog;
  var _auth=FirebaseAuth.instance.currentUser;
  String? select='';
  bool downnload=false;
  bool check=false;
  TextEditingController think=TextEditingController();
  TextEditingController selectAdd=TextEditingController();
  String? email;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    catalog=course().getCatlog;
    email=_auth!.email;
  }
  GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
  @override
  //the design market request
  Widget build(BuildContext context) {
    size_phone().init(context);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Scaffold(
            key: _scaff,
            drawer: drawer(),
            appBar: appBar.AppBarCourses('', context, _scaff),
            backgroundColor: Theme.of(context).backgroundColor,
            body:  email!=null?Container(
              margin:EdgeInsets.only(top: size_phone.defualtsize!*4,bottom: size_phone.defualtsize!*4,
                  left: size_phone.defualtsize!*5 ,
                  right: size_phone.width!<900?size_phone.defualtsize!*5:size_phone.defualtsize!*11),

              child: Row(
                //the size is phone the image not show
                children: [
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                              color: Colors.black12,
                              offset: Offset(-10,-10),
                              blurRadius: 20

                          )],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:size_phone.width!>800? Radius.circular(0): Radius.circular(size_phone.defualtsize!*2.5),
                              bottomLeft: size_phone.width!>800? Radius.circular(0): Radius.circular(size_phone.defualtsize!*2.5),
                              topRight:  Radius.circular(size_phone.defualtsize!*2.5),bottomRight:  Radius.circular(size_phone.defualtsize!*2.5)

                          ))  ,height: size_phone.height,
                      width:size_phone.width!>800? size_phone.width!/3:size_phone.width!/1.55,
                      padding: EdgeInsets.only(left:size_phone.defualtsize!*2,right: size_phone.defualtsize!*2 ),
                      child: Form_Course()),
                  if(size_phone.width!>=800)...{
                    Column(children: [
                      Expanded(
                        child: Container(
                          width: size_phone.width!/3,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(-10,-10),
                                  blurRadius: 20

                              )],
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(size_phone.defualtsize!*2.5),bottomLeft: Radius.circular(size_phone.defualtsize!*2.5)),
                              image: DecorationImage(
                                  image: AssetImage('images/Request_Market.jpg'),fit: BoxFit.cover
                              )
                          ),
                        ),
                      )
                    ],)
                  },
                  //form market



                ],
              ),

            ):Container(),

          ),
          if(downnload)  Container(
              color: Colors.grey.withOpacity(.1),
              height: size_phone.height,
              width: size_phone.width,
              child:LoadingOverlayPro(
                  progressIndicator: LoadingBouncingLine.circle(
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                  ),
                  isLoading: downnload, child: Text('')
              )
          ),
        ],
      ),
    );
  }
  Form_Course(){
      return Directionality(
        textDirection: TextDirection.rtl,
        child:
          Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [TypewriterAnimatedText('أطلب تدريب',textStyle: TextStyle(color:colormarket,fontFamily: 'header',fontSize: 22,fontWeight: FontWeight.bold),
                    speed: Duration(milliseconds: 100),cursor: '')],),
              check==false?  lis(catalog!): textfield('ادخل التصنيف',Icon(Icons.add),selectAdd),
              Row(
                children: [
                  Text("اضف تصنيف ",style: TextStyle(fontFamily:'body',fontSize: 22,color:colormarket,),),
                  Checkbox(value: check,
                      activeColor:colormarket,
                      onChanged: (val){
                        setState(() {
                          check=val!;
                        });
                      }),
                ],
              ),
              textfield('أدخل نبذة مختصرة عن الكورس',Icon(Icons.info_outline),think),

              Customer_config.CustomerButton('إرسال', colormarket, size_phone.defualtsize!*2, size_phone.defualtsize!*5,
                      () {
                    if(_key.currentState!.validate()){
                      setState(() {
                        downnload=true;
                      });
                      courseControl.RequestTraining(context, check==false?select!:selectAdd.text, think.text,email!).whenComplete(() {
                        setState(() {
                          downnload=false;
                          select!="";
                          think.text="";
                          selectAdd.text="";
                        });
                      });

                    };
                  })

            ],
          ),
        ),
      );
    }
  Container textfield(String title,Icon icon,TextEditingController control){
    return  Container(
      child: TextFormField(
        textDirection: TextDirection.rtl,
          controller: control,
          validator: (val){
            if(val!.isEmpty)
              return 'الحقل مطلوب';

          }
          ,
          onSaved: (val){
            control.text=val!;
          },
          keyboardType:title=='أدخل نبذة مختصرة عن الكورس'?TextInputType.multiline:TextInputType.text,
          maxLines: title=='أدخل نبذة مختصرة عن الكورس'?4:1,
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            focusColor:colormarket,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: icon,
            hintStyle: TextStyle(fontFamily:'body',fontSize: 22,color:Colors.grey,),
            hintText: title,
            enabledBorder:bord(),
            disabledBorder:bord(),
            border: bord(),
            focusedBorder: bord(),

          )
      ),
    );
  }
  DropdownSearch<String> lis(List<String> item){
    return DropdownSearch<String>(
      onSaved: (val){
        setState(() {
          if(val!=null)
            select=val;
        });
      },
      validator: (val){
        if(val!.isEmpty){ return 'اختر تصنيف الكورس';}
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            prefixIcon: Icon(Icons.category_outlined),
            border:bord(),
            label: Text("اختر تصنيف الكورس "),
            labelStyle: TextStyle(color: Colors.grey,fontFamily: 'body',fontSize: 27)
        ),
      ),
      popupProps: PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  border:bord()
              )
          ),
          menuProps: MenuProps(
              borderRadius: BorderRadius.circular(25),
              elevation:.5,
              barrierColor:Colors.blueGrey.withOpacity(.3)
          ),
          fit: FlexFit.tight
      ),
      onChanged: (val){
        setState(() {
          select=val!;
        });
      },
      items: item,
      selectedItem: select,

    );
  }

  OutlineInputBorder bord(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Color.fromRGBO(142, 152, 152, 1.0),
        )
    );
  }
  BoxShadow _shadow(){
    return BoxShadow(
        blurRadius: 10,
        spreadRadius: .05,
        color: Colors.grey.withOpacity(.5),
        offset: Offset(5,7)
    );
  }

}
