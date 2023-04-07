import 'dart:math';

class MyNumber {
  final double _number;

  MyNumber(this._number);

  bool isPerfectSquare(){
    var squareRoot = sqrt(_number);
    return _number == squareRoot * squareRoot;
  }

  bool isPerfectCube() {
    var cubeRoot = pow(_number, 1.0 / 3.0).round();
    return _number == cubeRoot * cubeRoot * cubeRoot;
  }
  
  @override
  String toString() {
    // Trim trailed zeros
    var trimmedNumber = _number.toString().replaceAll(RegExp(r"(\.0+)(?!.*\d)"), "");
    trimmedNumber = trimmedNumber.replaceAll(RegExp(r"\.$"), "");
    return trimmedNumber;
  }
}