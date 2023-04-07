import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_shapes/entities/my_number.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _txtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _txtController.dispose();
    super.dispose();
  }

  String _getNumberShape() {
    final number = double.tryParse(_txtController.text);
    if (number == null) return 'Invalid input';

    final myNumber = MyNumber(number);
    final String stringNumber = myNumber.toString();

    if (myNumber.isPerfectSquare() && myNumber.isPerfectCube()) {
      return 'Number $stringNumber is a perfect square and cube.';
    } else if (myNumber.isPerfectSquare()) {
      return 'Number $stringNumber is a perfect square.';
    } else if (myNumber.isPerfectCube()) {
      return 'Number $stringNumber is a perfect cube.';
    } else {
      return 'Number $stringNumber is neither a perfect square nor a perfect cube.';
    }
  }

// Validate the input value
  String? validate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }

    // Regex pattern to allow digits, decimal point
    final numberPattern = RegExp(r'^\d*\.?\d{0,15}');
    if (!numberPattern.hasMatch(value)) {
      return 'Please enter a valid number';
    }

    return null;
  }

  void showAlertBox() {
    var myNumber = MyNumber(double.parse(_txtController.text));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(myNumber.toString()),
          // Trims all unnecessary zeros from end
          content: Text(_getNumberShape()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('')
            )
          ]
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
                key: _formKey,
                child: TextFormField(
                    controller: _txtController,
                    decoration:
                        const InputDecoration(labelText: "Enter your number"),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true, signed: false),
                    inputFormatters: [
                      //  Allow digits, decimal point
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,15}'))
                    ],
                    maxLength: 16))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
                _txtController.text != '' ? showAlertBox() : null;
          },
          backgroundColor: Colors.pinkAccent,
          child: const Icon(Icons.check)
        ));
  }
}
