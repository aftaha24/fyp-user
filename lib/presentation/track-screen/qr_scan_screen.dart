import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';

import 'manual_track_screen.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/track_screen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 400.h,
            width: MediaQuery.of(context).size.width,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) async {
                await controller.resumeCamera();
                controller.scannedDataStream.listen((scanData) async {
                  log(scanData.code.toString());
                  if (scanData.code != null) {
                    await controller.pauseCamera();
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ManualTrackScreen(
                          createAt: jsonDecode(scanData.code!)['createdAt'],
                          hiveNumber: jsonDecode(scanData.code!)['hiveNumber'],
                        ),
                      ),
                    );
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
