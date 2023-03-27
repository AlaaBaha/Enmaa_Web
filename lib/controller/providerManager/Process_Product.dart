
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
class Process_Product extends ChangeNotifier{
  String? process;
  setProduct(String catalog){
    this.process=catalog;
    notifyListeners();
  }

}