import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myedc/Pages/AlertMessage.dart';
import 'package:myedc/Pages/Home.dart';
import 'package:myedc/Pages/myconst.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import './responeClass.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class QrPage extends StatefulWidget {
  final String? qrstring;
  const QrPage({Key? key, this.qrstring}) : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  ReqGenQr? _queryMsisdn;

  @override
  void initState() {
    // print(widget.qrstring);
    // alertSuccess();

    String amt = widget.qrstring.toString().replaceAll(RegExp('[^0-9]'), '');

    genQr(amt);

    super.initState();
  }

  messagebox(BuildContext context) async {
    AwesomeDialog(
      context: context,
      animType: AnimType.LEFTSLIDE,
      headerAnimationLoop: false,
      dialogType: DialogType.SUCCES,
      showCloseIcon: true,
      title: 'ສຳເລັດ',
      titleTextStyle: TextStyle(fontSize: 24),
      desc: 'The QR has been successed \n ',
      // btnOkOnPress: () {
      //   //debugPrint('OnClcik');
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => HomePage(),
      //       ));
      // },
      btnOkIcon: Icons.check_circle,
      onDissmissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
    ).show();
  }

  genQr(String amount) async {
    var random = new Random();
    var rnd = random.nextInt(99999);
    String leadrnd = rnd.toString().padLeft(6, '0');
    DateFormat dateFormat = DateFormat("yyMMddHHmmss");
    String strDate = dateFormat.format(DateTime.now());

    String id = strDate + leadrnd;

    //print(id);

    http.Response response =
        await http.post(Uri.parse('http://172.28.14.87:7000/GenerateQR'),
            headers: {
              "Content-Type": "application/json",
            },
            body: json.encode({
              "amount": amount,
              "username": "adc3a3358d1a4c0482d88f356d3b9ba4",
              "fee": "0",
              "tranid": "20220316092300003"
            }));

    // print(response);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // print(response.body);
      var res = ReqGenQr?.fromJson(jsonDecode(response.body));
      setState(() {
        _queryMsisdn = res;
      });
      // _queryMsisdn = res.;
      messagebox(context);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Generate QR.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ກະລຸນາ Scan QR code'),
        backgroundColor: Mycolor.mainColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Mini Big C ສາຂາ ດົງໂດກ ", //this.qrstring.toString(),
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: QrImage(
                  data: this._queryMsisdn?.qrcodeStr ??
                      "", //this.qrstring.toString(),
                  version: QrVersions.auto,
                  size: 350.0,
                  gapless: false,
                  embeddedImage: AssetImage('assets/images/mmoney.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(50, 50),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
