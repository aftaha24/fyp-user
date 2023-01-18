import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class HiveAnalysisScreen extends StatelessWidget {
  const HiveAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Container(
            height: 300.h,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffBFB0E9),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/hive1.png",
                        height: 110.h,
                      ),
                      Image.asset(
                        "assets/images/hive2.png",
                        height: 110.h,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/hive3.png",
                        height: 110.h,
                      ),
                      Image.asset(
                        "assets/images/hive4.png",
                        height: 110.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 300.h,
            width: MediaQuery.of(context).size.width,
            color: lightgreenColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Analaysis of Hives",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 320.w,
                    child: Text(
                      "Admins can visually see trends at a glance, a graphical representation gives the users a snapshot view of where the honey production of particular user is at.",
                      style: subHeadingStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "​See the hive count and strength trend over the year.",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "Can view the production of honey in each hive.",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "Can compare the production between each hive",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
