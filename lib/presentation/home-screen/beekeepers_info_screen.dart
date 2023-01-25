import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:traceebee_users_app/models/hive_model.dart';
import 'package:traceebee_users_app/presentation/user-screens/user_screen.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/services/firestore_service.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class BeeKeepersInfoScreen extends StatefulWidget {
  const BeeKeepersInfoScreen({super.key});

  @override
  State<BeeKeepersInfoScreen> createState() => _BeeKeepersInfoScreenState();
}

class _BeeKeepersInfoScreenState extends State<BeeKeepersInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: StreamBuilder<List<HiveModel>>(
          stream: FireStoreService()
              .fetchHives(FirebaseAuth.instance.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              log(snapshot.error.toString());
              log(snapshot.hasError.toString());
            }
            if (snapshot.hasData) {
              var beeKeepersList = snapshot.data;
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: List.generate(
                      beeKeepersList!.length,
                      (index) {
                        final hive = beeKeepersList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return UserScreen(
                                    hives: beeKeepersList,
                                    userName: hive.userName!,
                                  );
                                }),
                              );
                            },
                            child: Container(
                              height: 170.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.w,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          SizedBox(
                                            width: 180,
                                            child: Text(
                                              "USER : ${hive.userName}",
                                              style: subHeadingStyle,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "No. of Hives: ${hive.hiveNumber}",
                                            style: subHeadingStyle,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            hive.createdAt!,
                                            style: subHeadingStyle,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            hive.amountHoney ?? '0',
                                            style: subHeadingStyle,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => Scaffold(
                                                    appBar: AppBar(
                                                      elevation: 0,
                                                      backgroundColor:
                                                          Colors.lightGreen,
                                                    ),
                                                    body: Center(
                                                      child: QrImage(
                                                        data: jsonEncode({
                                                          "hiveNumber":
                                                              hive.hiveNumber,
                                                          "createdAt":
                                                              hive.createdAt,
                                                        }),
                                                        version:
                                                            QrVersions.auto,
                                                        size: 200.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'View QR Code',
                                              style: subHeadingStyle.copyWith(
                                                  color: Colors.green),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Image.network(
                                        hive.driveLink!,
                                        height: 130.h,
                                        width: 150.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }
            return const Center(child: Text('No Data'));
          }),
      // body:
    );
  }
}
