import 'package:flutter/material.dart';
class Fun_Market{
var sizephone;
BuildContext? context;
  @override
  void build( context) {
    sizephone=MediaQuery.of(context).size;
   
  }
// return DisplayPro( data('Catalog'),
// snapshot.data?.docs[index].get('ImgPath'),
// snapshot.data?.docs[index].get('namePro'),snapshot.data?.docs[index].get('pro_id')) ;
// Container(
// padding: EdgeInsets.only(top: size_phone.defualtsize!*1,left: size_phone.defualtsize!*1),
// height: sizephone.height,
// width: sizephone.width,
// child: GridView.builder(
// itemCount:snapshot.data?.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount:show(sizephone.width),),
// itemBuilder: (context,index){
// var data=snapshot.data![index];
// return DisplayPro( data('Catalog'),
// snapshot.data?.docs[index].get('ImgPath'),
// snapshot.data?.docs[index].get('namePro'),snapshot.data?.docs[index].get('pro_id')) ;
//
// }));
  // Container itemsDetail(String title, String image, List<String> detail) {
  //   return Container(
  //       margin: EdgeInsets.all(15),
  //       decoration: BoxDecoration(
  //           color: Colors.white,
  //           boxShadow: _shadow()
  //       ),
  //       child: Stack(
  //           children: [
  //             Center(
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                       image: DecorationImage(
  //                         image: AssetImage(image,),
  //                         fit: BoxFit.fill,
  //                       ),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           blurRadius: 5,
  //                           spreadRadius: .08,
  //                           offset: Offset(1, 0),
  //                           color: Color.fromRGBO(127, 70, 32, 1.0),
  //                         ),
  //                       ]
  //                   ),
  //                   margin: EdgeInsets.only(
  //                       top: 40, bottom: 60, left: 70, right: 70),
  //                 )),
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 Container(
  //                   height: sizephone.height / 5,
  //                   width: sizephone.width,
  //                   decoration: BoxDecoration(
  //                       color: Color.fromRGBO(235, 235, 235, 1.0).withOpacity(
  //                           .6)
  //                   ),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         detail[0], style: TextStyle(color: Color.fromRGBO(
  //                           127, 70, 32, 1.0), fontSize: 18),)
  //                     ],
  //                   ),)
  //               ],
  //             ),
  //           ])
  //   );
  // }
  // Container items(String title,String image){
  //   return Container(
  //     margin: EdgeInsets.all(15),
  //     decoration: BoxDecoration(
  //         color: Colors.white,
  //         boxShadow:[BoxShadow(
  //           blurRadius: 7,
  //           spreadRadius: .08,
  //           offset: Offset(3,3),
  //           color: Color.fromRGBO(127, 70, 32, 1.0),
  //         ),
  //           BoxShadow(
  //             blurRadius: 7,
  //             spreadRadius: .08,
  //             offset: Offset(-3,-3),
  //             color: Color.fromRGBO(127, 70, 32, 1.0),
  //           ),]
  //     ),
  //     child: Column(
  //       children: [
  //         Expanded(
  //             child:Container(
  //               margin: EdgeInsets.only(top: 10,bottom: 20),
  //               child:Image.asset(image,fit: BoxFit.fill,),)),
  //         Container(
  //             margin: EdgeInsets.only(top: 10,bottom: 10),
  //             child: ElevatedButton(onPressed: (){}, child: Padding(
  //               padding: const EdgeInsets.only(left: 50,right: 50),
  //               child: Text(title),
  //             ),
  //               style:ElevatedButton.styleFrom(
  //                   backgroundColor: Color.fromRGBO(127, 70, 32, 1.0),
  //                   shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(25)
  //                   )
  //               ),
  //             ))
  //       ],
  //     ),
  //
  //   );
  // }
  //
  //  List<BoxShadow> _shadow(){
  //    return [BoxShadow(
  //      blurRadius: 7,
  //      spreadRadius: .08,
  //      offset: Offset(3,3),
  //      color: Color.fromRGBO(127, 70, 32, 1.0),
  //    ),
  //      BoxShadow(
  //        blurRadius: 7,
  //        spreadRadius: .08,
  //        offset: Offset(-3,-3),
  //        color: Color.fromRGBO(127, 70, 32, 1.0),
  //      ),];
  //  }
}
