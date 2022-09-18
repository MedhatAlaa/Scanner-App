import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scan_app/componentes/re_component.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  var qrScan = 'Scanner Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Scan QR Code'),
            backgroundColor: Colors.white,
            collapsedHeight: 200.0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(200.0),
                  bottomLeft: Radius.circular(200.0),
                ),
                gradient: gradient(),
              ),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.white10,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              buildColumnScan(),
            ]),
          ),
        ],
      ),
    );
  }

  Column buildColumnScan() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 50.0,
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).size.height * 0.04,
          ),
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: gradient(),
          ),
          child: TextButton(
            onPressed: qrScanner,
            child: const Text(
              'Press to Scan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 15.0),
          padding: const EdgeInsets.all(10.0),
          height: 180.0,
          width: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey[400]!, spreadRadius: 10.0),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.white12,
              ],
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(200.0),
              bottomRight: Radius.circular(200.0),
            ),
          ),
          child: Text(
            qrScan,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.21,
          width: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.blue[500]!,
                Colors.blue[100]!,
                Colors.black,
                Colors.lightBlueAccent,
                Colors.blue[100]!,
                Colors.black,
                Colors.lightBlueAccent,
              ],
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(200.0),
              bottomLeft: Radius.circular(200.0),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> qrScanner() async {
    await FlutterBarcodeScanner.scanBarcode(
      '#2A99CF',
      'cancel',
      true,
      ScanMode.QR,
    ).then((value) {
      setState(() {
        qrScan = value;
      });
    }).catchError((error) {
      print('error when scanning is ${error.toString()}');
    });
  }
}
