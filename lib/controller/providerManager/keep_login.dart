import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
class keep_login extends ChangeNotifier{
  String? email;
  String ?password;
 bool  isLogin=false;
// Future<SharedPreferences>? sharedPreferences;
// setDetail({required email,required password}){
//   sharedPreferences =SharedPreferences.getInstance() ;
//  // sharedPreferences
//
// }
// checkifLogin(FirebaseAuth){
//   FirebaseAuth.instance!.authStateChanges().listen((User? user) {
//     if(user!=null){
//       isLogin=true;
//     }
//   });
//   notifyListeners();
//
// }
  changeUserAuth(){
    isLogin==false?isLogin=true:isLogin=false;
    notifyListeners();
  }
}