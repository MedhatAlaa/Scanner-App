import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan_app/componentes/re_component.dart';

class CreateQrScreen extends StatefulWidget {
  const CreateQrScreen({Key? key}) : super(key: key);

  @override
  State<CreateQrScreen> createState() => _CreateQrScreenState();
}

class _CreateQrScreenState extends State<CreateQrScreen> {
  var qrScan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Create QR Code'),
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
              buildColumnCreate(),
            ]),
          ),
        ],
      ),
    );
  }

  Column buildColumnCreate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
              // gradient: gradient(),
              ),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                qrScan = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Create QR Code ',
              // hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        BarcodeWidget(
          data: qrScan,
          barcode: Barcode.qrCode(),
          decoration: const BoxDecoration(
              // gradient: gradient(),
              ),
          height: 280.0,
          width: 280.0,
        ),
      ],
    );
  }
}
