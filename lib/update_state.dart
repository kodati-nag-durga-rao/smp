

import 'package:flutter/material.dart';

class UpdateState extends ChangeNotifier{

  List<int> dataList = [1,2,3];

  void updateList(){
    
    dataList.add(dataList.last+1);
    notifyListeners();
  }


  void decrementList(){
    
   dataList.removeLast();
    
    notifyListeners();
  }

}