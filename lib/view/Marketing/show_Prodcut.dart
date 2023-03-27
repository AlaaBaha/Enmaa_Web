import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/config/Text_Style.dart';
import 'package:smallmicroproduct/view/Widgets/Button.dart';

import '../../config/Color_style.dart';
import '../../config/size_phone.dart';
import '../../controller/market/market_Controller.dart';
import '../../controller/providerManager/specific_Show_product.dart';
import '../../model/MarketModel/MarketModel.dart';
import '../../view/Widgets/appBar.dart';
import '../../model/MarketModel/detail.dart';
import '../home_screen/drawer.dart';
import 'Fun_Market.dart';
import 'detail_product.dart';
import 'package:firebase_auth/firebase_auth.dart';


enum Cataloger{
  Me,All;
}

class show_product extends StatefulWidget {

   show_product({Key? key}) : super(key: key);

  @override
  State<show_product> createState() => show_productState();
}

class show_productState extends State<show_product> {
  FilePickerResult? file;
  List<String>? catalogSearch;
  String selectdrop= "";
  Cataloger? catalog;
  Fun_Market _fun_market=Fun_Market();
  List<detail>? DitailPro;
  Uint8List? bytes;
  TextEditingController controlsearch=TextEditingController();
  String searchitem="";
  MarketModel mar=MarketModel();
  FirebaseAuth Auth=FirebaseAuth.instance;
  String? email;
  specific_Show_product? show_product;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    show_product=Provider.of<specific_Show_product>(context,listen: false);
   setCatloger();
    catalogSearch=market_Controller().getCatlog;
  }
setCatloger(){
  show_product!.show_product=='Me'?
  catalog=Cataloger.Me:catalog=Cataloger.All;
  if(  show_product!.show_product=='Me'){
    email=Auth.currentUser!.email;

  }
}

  @override
  Widget build(BuildContext context) {
    size_phone().init(context);
    GlobalKey<ScaffoldState> _scaff=GlobalKey<ScaffoldState>();
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaff,
          drawer: drawer(),
              appBar: appBar.AppBarCourses(catalog==Cataloger.All?'المنتجات المسوقة ':' منتجاتي',context,_scaff),
              body:StreamBuilder(
                  stream:catalog==Cataloger.All?mar.Allproduct(selectdrop.isEmpty?"":selectdrop):mar.MeProduct(email!),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                    print(snapshot.error);
                    print(snapshot.connectionState);
                    return (!snapshot.hasData||snapshot.connectionState == ConnectionState.waiting||snapshot.connectionState == ConnectionState.none)?
                     Center(child: CircularProgressIndicator(
                      strokeWidth: 6,
                      color: Color.fromRGBO(2, 19, 79, 1.0),
                    )):
                    snapshot.data!.docs.length==0?
                    Center(child:Text('لا توجد منتجات لعرضها ',style: Text_Style().StyleFount(size: 30, fountFamily: "body", color: colorOrigin),) ):
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SingleChildScrollView(

                        child: Column(
                          textDirection: TextDirection.rtl,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(top:size_phone.defualtsize!*1 ),
                                  height:size_phone.defualtsize!*4,
                                  width:size_phone.defualtsize!*15,
                                  child: lis(catalogSearch!)),
                            ),
                            Container(
                            padding: EdgeInsets.only(top: size_phone.defualtsize!*1,left: size_phone.defualtsize!*1),
                            height:size_phone.height,
                            width: size_phone.width,
                            child: GridView.builder(
                              //snapshot error
                            itemCount:snapshot.data?.docs.length,
                            itemBuilder: (context,index){
                   var data= snapshot.data!.docs[index].data() as  Map<String,dynamic>;

             return DisplayProduct( data!['namePro'],
                 data['ImgPath'],  data['price'],data['prod_id']) ;

                            },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:show(size_phone.width!),),)),
                          ],
                        ),
                      ),
                    );})
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
        baseStyle:  TextStyle(color:colorOrigin,fontFamily: 'body',fontSize: 27),
          textAlign:TextAlign.right,
        dropdownSearchDecoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            prefixIcon: Icon(Icons.search),
            border:bord(),
            label: Text("البحث علي حسب :"),
            counterStyle: TextStyle(color: Colors.grey,fontFamily: 'body',fontSize: 27)
        ),
      ),
      popupProps: PopupProps.menu(
          searchFieldProps: TextFieldProps(
              textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.grey,fontFamily: 'body',fontSize: 27),
              decoration: InputDecoration(
                hintTextDirection: TextDirection.rtl,
                  labelStyle:  TextStyle(color: Colors.grey,fontFamily: 'body',fontSize: 27),
                  border:bord(),
                  focusedBorder:bord() ,
                  floatingLabelStyle: TextStyle(color: Colors.grey,fontFamily: 'body',fontSize: 27)
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
  int show(double size  ){
    if(size<=700)
      return 2;
    else if(
    size>700&&size<1000)
      return 3;
    else
      return 4;
  }
 DisplayProduct(String title, String image, dynamic price,String ID) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        alignment: AlignmentDirectional.topEnd,
          margin: EdgeInsets.all(size_phone.defualtsize!*2),
          decoration: BoxDecoration(
                borderRadius: BorderRadius.all( Radius.circular(size_phone.defualtsize!*2)),
              color: Colors.white,
            boxShadow: [BoxShadow(
              color: Color(0xFF050257).withOpacity(.5),
              offset: Offset(3,3),
              blurRadius: 3
            )]
          ),
          child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight:  Radius.circular(size_phone.defualtsize!*2),
                      topLeft:  Radius.circular(size_phone.defualtsize!*2),

      )
                  ),
                  child:Image.network(image,fit: BoxFit.fill,) ,
                  height: size_phone.defualtsize!*9,
                  width:size_phone.defualtsize!*18 ,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: size_phone.height! / 5,
                      width: size_phone.width,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 235, 235, 1.0).withOpacity(.6),
                          borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(size_phone.defualtsize!*2),
                            bottomRight:  Radius.circular(size_phone.defualtsize!*2),

                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            " اسم المنتج:    $title", style: TextStyle(color:Color(0xFF050257), fontSize: 21,fontFamily: 'body'),
                            textDirection:TextDirection.rtl ,),
                          Text(
                            " سعر المنتج:    $price", style: TextStyle(color: Color(0xFF050257), fontSize: 21,fontFamily: 'body'),
                              textDirection:TextDirection.rtl ),

                          Customer_config.CustomerButton(catalog==Cataloger.All?'عرض ':'عرض ',colormarket
  , size_phone.defualtsize!*1.4, size_phone.defualtsize!*5,
                                  (){ Navigator.of(context).push(MaterialPageRoute(builder: (context){
  return detail_product(ID);})

                         );})
                        ],
                      ),)
                  ],
                ),
              ])
      ),
    );
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

