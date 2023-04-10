import 'dart:math';

class MyNumber {
  MyNumber(this._number);
  final double _number;

  bool isPerfectSquare() {
    final double squareRoot = sqrt(_number);
    return _number == squareRoot * squareRoot;
  }

  bool isPerfectCube() {
    final int cubeRoot = pow(_number, 1.0 / 3.0).round();
    return _number == cubeRoot * cubeRoot * cubeRoot;
  }

  @override
  String toString() {
    // Trim trailed zeros
    String trimmedNumber = _number.toString().replaceAll(RegExp(r'(\.0+)(?!.*\d)'), '');
    trimmedNumber = trimmedNumber.replaceAll(RegExp(r'\.$'), '');
    return trimmedNumber;
  }
}
