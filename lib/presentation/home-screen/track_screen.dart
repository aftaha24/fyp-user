import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_users_app/presentation/home-screen/widgets/track_home_widgets.dart';
import 'package:traceebee_users_app/presentation/track-screen/manual_track_screen.dart';
import 'package:traceebee_users_app/presentation/track-screen/nfc_screen.dart';
import 'package:traceebee_users_app/presentation/track-screen/qr_scan_screen.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 210.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/track_screen.png"),
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 150.h),
                child: Text(
                  "TRACK HONEY",
                  style: headingStyle,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500.h,
            color: const Color(0xffFFEE95),
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TrackMenuWidget(
                        image: 'assets/images/track1.png',
                        title: "Manual Tracking",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ManualTrackScreen(
                                createAt: '',
                                hiveNumber: '',
                              ),
                            ),
                          );
                        },
                      ),
                      TrackMenuWidget(
                        image: 'assets/images/track2.png',
                        title: "QR code track",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QRScanScreen(),
                            ),
                          );
                        },
                      ),
                      TrackMenuWidget(
                        image: 'assets/images/track3.png',
                        title: "NFC track",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NfcScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
