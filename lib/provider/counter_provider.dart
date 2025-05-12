import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {

  int _counter = 0; // this is private variable and uou cannot access it outside of this class
  int get counter => _counter; // this is a getter method to access the private variable
  int getCount()=> _counter; // this is a method to access the private variable

  ///events
  void increment() {
    _counter++;
    notifyListeners();  // updates the UI
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}