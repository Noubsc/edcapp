import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:myedc/Pages/myconst.dart';
import './numpad.dart';
import './QR.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ຈ່າຍຜ່ານ QR '),
        backgroundColor: Mycolor.mainColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // display the entered numbers
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 70,
              child: Center(
                  child: TextField(
                controller: _myController,
                textAlign: TextAlign.center,
                showCursor: false,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                    color: Color.fromARGB(255, 1, 53, 122)),
                // Disable the default soft keybaord
                keyboardType: TextInputType.none,
              )),
            ),
          ),
          // implement the custom NumPad
          NumPad(
            buttonSize: 80,
            buttonColor: Color.fromARGB(184, 12, 12, 12),
            iconColor: Mycolor.mainColor,
            controller: _myController,
            delete: () {
              if (_myController.text.length > 0) {
                _myController.text = _myController.text
                    .substring(0, _myController.text.length - 1);
              }
            },
            // do something with the input numbers
            onSubmit: () {
              debugPrint('Your code: ${_myController.text}');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrPage(
                      qrstring: _myController.text,
                    ),
                  ));
              // showDialog(
              //     context: context,
              //     builder: (_) => AlertDialog(
              //           content: Text(
              //             "You code is ${_myController.text}",
              //             style: const TextStyle(fontSize: 20),
              //           ),
              //         ));
            },
          ),
        ],
      ),
    );
  }
}
