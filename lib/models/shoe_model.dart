import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _shoeImage = 'assets/images/azul.png';
  double _shoeSize = 9.0;

  String get getShoeImage => _shoeImage;
  set setShoeImage(String shoeImage) {
    _shoeImage = shoeImage;
    notifyListeners();
  }

  double get getShoeSize => _shoeSize;
  set setShoeSize(double shoeSize) {
    _shoeSize = shoeSize;
    notifyListeners();
  }
}
