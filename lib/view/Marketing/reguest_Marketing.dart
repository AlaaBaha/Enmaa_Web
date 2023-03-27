// This file to introduce request marketing functions
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:smallmicroproduct/config/size_phone.dart';
import 'package:smallmicroproduct/view/Course/fun_Course.dart';
import 'package:smallmicroproduct/view/Widgets/appBar.dart';
import 'package:smallmicroproduct/view/home_screen/drawer.dart';

import '../../config/Color_style.dart';
import '../../config/alert.dart';
import '../../controller/market/market_Controller.dart';

// this enum class explain if the product is edited or it is new product
class reguest_Marketing extends StatefulWidget {
  reguest_Marketing({Key?key });
  @override
  State<reguest_Marketing> createState() => _reguest_MarketingState();
}

class _reguest_MarketingState extends State<reguest_Marketing> {

  TextEditingController  control_name=new TextEditingController();
  TextEditingController control_price=new TextEditingController();
  TextEditingController control_describte=new TextEditingController();
  TextEditingController control_phone=new TextEditingController();
  TextEditingController control_ImgPro=new TextEditingController();
  TextEditingController control_select=new TextEditingController();
  GlobalKey<FormState> _key=GlobalKey<FormState>();
  bool downnload=false;
  List<String>? catalog;
  String selectdrop= "";
  //the list need to edit
    String pattren= r'^(?:[*0]10)?[0-9]{10}$';

  FilePickerResult? file;
  PlatformFile? ImagInf;
  market_Controller market_controller=market_Controller();
  GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
  bool check=false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    catalog=market_controller.getCatlog;
  }
  @override
  //the design market request
  Widget build(BuildContext context) {
    size_phone().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Scaffold(
            key: _scaff,
            drawer: drawer(),
            appBar: appBar.AppBarCourses('', context, _scaff),
            backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(
              children: [
                Container(
                    margin:EdgeInsets.only(top: size_phone.defualtsize!*3,bottom: size_phone.defualtsize!*3,
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
                                child: Form_Market()),
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
// This function to display request marketing fields to the user to get info from them
  Form Form_Market(){
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //text header
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [TypewriterAnimatedText('سوق منتجك',textStyle: TextStyle(color:colormarket,fontFamily: 'header',fontSize: 22,fontWeight: FontWeight.bold),
            speed: Duration(milliseconds: 100),cursor: '')],),
            textfield('ادخل اسم منتجك', Icon(Icons.shopping_cart_sharp),this.control_name),
            SizedBox(height: size_phone.defualtsize!*.8,),
            //select image of product
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  decoration: BoxDecoration(
                      color: colormarket,
                      borderRadius: BorderRadius.circular(50),
                      ),
                  child: TextButton(onPressed: selectFile,style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.only(left: 11,right: 11,top: 13,bottom: 13))),
                      child: Text('اختار',style: TextStyle(fontSize: 25,color: Colors.white, fontFamily: "body"),)
                  )),
                Expanded(
                    child: textfield(control_ImgPro.text!=''?control_ImgPro.text!:'ادخل صورة منتجك',Icon(Icons.camera),control_ImgPro),
                ),
              ],
            ),
            //the catlog of product
            SizedBox(height: size_phone.defualtsize!*.8,),
            Row(children: [
              Flexible(flex:1,child:  textfield(' سعر منتجك', Icon(Icons.money),this.control_price),),
              SizedBox(width: size_phone.defualtsize!*.3,),
              Flexible(flex:2,child:  textfield('ادخل مكان منتجك', Icon(Icons.info_outlined),this.control_describte),)
              ],),
            SizedBox(height: size_phone.defualtsize!*.8,),
            textfield('أدخل رقم هاتفك للتواصل', Icon(Icons.phone_android),this.control_phone),
            SizedBox(height: size_phone.defualtsize!*.8,),
            check==true? textfield('اضف تصنيف ', Icon(Icons.add),this.control_select):lis(catalog!),
            SizedBox(height: size_phone.defualtsize!*.8,),
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
            SizedBox(height: size_phone.defualtsize!*.8,),
            ElevatedButton(onPressed: (){
print(control_phone.text);
             if(_key.currentState!.validate()){
               setState(() {
                 downnload=true;
               });
               market_controller.insertProuduct(context,ImagInf!.name,control_name.text,ImagInf!.bytes, check==true?control_select.text:selectdrop,
                   double.parse(control_price.text),control_describte.text,int.parse(control_phone.text)).whenComplete((){
                 setState(() {
                   downnload=false;
                   control_ImgPro.text='';
                   control_phone.text='';
                   control_describte.text='';
                   control_name.text="";
                   control_price.text="";
                   control_select.text='';
                 });
               });

             };

             }, child: Text('إرسال', style: TextStyle(fontFamily: "body", fontSize: 25),),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 33),
                    // elevation: .7,

                    backgroundColor:colormarket,
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),),
          ],
        ),
      ),
    );
  }
 textfield(String title,Icon icon,TextEditingController Control){
    return   TextFormField(
      textDirection: TextDirection.rtl,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        toolbarOptions: ToolbarOptions(copy: true,paste: true,selectAll: true),
        readOnly: Control==control_ImgPro?true:false,
        controller: Control,
        //valid session
        validator:title=='أدخل رقم هاتفك للتواصل'? (val){
          RegExp regex=RegExp(pattren);
          if(val!.isEmpty){ return 'الحقل مطلوب';}
          else if(!regex.hasMatch(val!)){
            return 'رقم التواصل غير صحيح';
          }
        }:title=='ادخل سعر منتجك'?
        (val){
          final numericRegex =
          RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
          if(val!.isEmpty){ return 'الحقل مطلوب';}
          if(!numericRegex.hasMatch(val!)){
            return 'ادخل قيمة صحيحة';
          }
        }:(val){
          if(Control==control_describte&&val!.isNum)
            return 'لا تدخل رقم';
          else  if(Control==control_name&&val!.isNum)
            return 'لا تدخل رقم';
          else  if(Control==control_select&&val!.isNum)
            return 'لا تدخل رقم';
         else  if(val!.isEmpty||val==''){
            return 'الحقل مطلوب';
          }
        },
        decoration: InputDecoration(

          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon,
          floatingLabelStyle: TextStyle(
            color:colormarket,
          ),
          hintText: title,
          hintStyle: TextStyle(fontFamily:'body',fontSize: 22,color:Colors.grey,),
          enabledBorder:bord(),
          disabledBorder:bord(),
          border: bord(),
          focusedBorder: bord(),
          focusColor: Color.fromRGBO(232, 152, 115, 1.0),
        ),
      );
  }
  DropdownSearch<String> lis(List<String> item){
    return DropdownSearch<String>(
      onSaved: (val){
        setState(() {
          if(val!=null)
            selectdrop=val;
        });
      },
      validator: (val){
        if(val!.isEmpty){ return '';}
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: Icon(Icons.category_outlined),
          border:bord(),
          label: Text("اختر تصنيف منتجك "),
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
          selectdrop=val!;
        });
      },
      items: item,
      selectedItem: selectdrop,

    );
  }
  Future<void> selectFile()async{
    FilePickerResult? _filePickerResult;

    try {
      _filePickerResult = await FilePicker.platform.pickFiles(
        allowedExtensions: ['jpg','png','jpeg','jfif'],
        type: FileType.custom,);
      if (_filePickerResult != null) {
       ImagInf=_filePickerResult.files.single;
        setState(() {
          control_ImgPro.text = _filePickerResult!.files.single.name;
          file= _filePickerResult;
          Uint8List? uploader =ImagInf!.bytes;

        });

      }

    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }

   }
   OutlineInputBorder bord(){
    return OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: BorderSide(
      color: Colors.grey
    )
    );
  }


}

