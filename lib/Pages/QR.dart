import 'package:flutter/material.dart';
import 'package:myedc/Pages/myconst.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatelessWidget {
  final String? qrstring;
  QrPage({Key? key, this.qrstring}) : super(key: key);
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
              "Mini Big C ສາຂາ ດົງໂດກ", //this.qrstring.toString(),
              style: TextStyle(fontSize: 24.0),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(1.0),
              child: QrImage(
                  data:
                      "0002010102125208MERCHANT5303418550560000560105702005802LA5932adc3a3358d1a4c0482d88f356d3b9ba46009Vientiane81020063045fa3", //this.qrstring.toString(),
                  version: QrVersions.auto,
                  size: 300.0,
                  gapless: false,
                  embeddedImage: AssetImage('assets/images/mmoney.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(50, 50),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
