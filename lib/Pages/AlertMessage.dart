import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlertMessage extends StatefulWidget {
  const AlertMessage({super.key});

  @override
  State<AlertMessage> createState() => _AlertMessageState();
}

class _AlertMessageState extends State<AlertMessage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedButton(
        text: 'Info Dialog fixed width and square buttons',
        pressEvent: () {},
      ),
    );
  }
}
