import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
class specific_Show_product extends ChangeNotifier{
   String? show_product;
  setProduct(String catalog){
    this.show_product=catalog;
    notifyListeners();
  }

}