import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier{
  List<Map<String, dynamic>> _list = [];

   List <Map<String, dynamic>> get list => _list;
    
    /// events
    void addItem(Map<String, dynamic> item) {
    _list.add(item);
    notifyListeners();
    }
    void removeItem(int index) {
      _list.removeAt(index);
      notifyListeners();
    }

    void updateItem(int index, Map<String, dynamic> item) {
        _list[index] = item;
        notifyListeners();
    }

    List<Map<String,dynamic>> getItem()
    {
      return _list;
    }

}