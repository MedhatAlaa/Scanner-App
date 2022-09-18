import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scan_app/componentes/re_component.dart';
import 'package:scan_app/screens/create_qr_screen.dart';
import 'package:scan_app/screens/scan_qr_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Scanner App'),
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
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: gradient(),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageTransition(
                              child: const CreateQrScreen(),
                              type: PageTransitionType.rightToLeft,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                            ),
                          );
                        },
                        child: const Text(
                          'Create QR Code',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: gradient(),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageTransition(
                              child: const ScanQrScreen(),
                              type: PageTransitionType.rightToLeft,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                            ),
                          );
                        },
                        child: const Text(
                          'Read QR Code',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
