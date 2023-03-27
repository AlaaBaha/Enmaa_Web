import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smallmicroproduct/controller/providerManager/keep_login.dart';
import 'package:smallmicroproduct/view/Course/detail_Of_Courses.dart';
import 'package:smallmicroproduct/view/Course/reguest_cource.dart';
import 'package:smallmicroproduct/view/Course/show_course.dart';
import 'package:smallmicroproduct/view/Funding/request_Funding.dart';
import 'package:smallmicroproduct/view/Profile/profile.dart';
import 'package:smallmicroproduct/view/home_screen/dev_Us.dart';
import 'package:smallmicroproduct/view/home_screen/home_screen.dart';
import 'package:smallmicroproduct/view/login/login.dart';
import 'package:smallmicroproduct/view/login/register.dart';
import 'package:smallmicroproduct/view/Marketing/reguest_Marketing.dart';
import 'package:smallmicroproduct/view/Marketing/show_Prodcut.dart';
import 'config/Name_Page.dart';

import 'controller/providerManager/specific_Show_product.dart';

import 'model/Auth_Model/Auth_DB.dart';
import 'view/login/VerficationEmail.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey:"AIzaSyBKke-SKRNDAP_7cDWA0NX7YzJTs6nmF_8",
          appId: "1:315962012314:web:a4a89e897fb3bf14afa523",
          messagingSenderId:"315962012314",
          projectId:"enmaa-d75bd")
  );
  runApp(homepage());
}
class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiProvider(
        providers: [ChangeNotifierProvider<keep_login>(create: (context)=>keep_login()),
          ChangeNotifierProvider<specific_Show_product>(create: (context)=>specific_Show_product())],
        child: GetMaterialApp(
          initialRoute: 'Home',
          routes:RouterClass(),
          theme: ThemeData(
              backgroundColor: Color(0xC2CBC5)),

          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  RouterClass() {
    return {
      NamePage.login: (context) => login(),
      NamePage.register: (context) => register(),
      NamePage.funding: (context) => request_Funding(),
      NamePage.Marketed: (context) => reguest_Marketing(),
      NamePage.request_trainig: (context) => reguest_course(),
      NamePage.show_Product: (context) => show_product(),
      NamePage.Home: (context) => home_screen(),
      NamePage.Us: (context) => dev_Us(),
      NamePage.profile: (context) => profile(),
      NamePage.show_Cources:(context) =>show_cource(),
      NamePage.detail_Of_Courses :(context) => detail_Of_Courses(),
    };
  }
}


  