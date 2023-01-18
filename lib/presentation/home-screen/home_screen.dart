import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_info_container.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/home_image.png"),
              Positioned(
                top: 10.h,
                left: 20.w,
                child: Container(
                  height: 180.h,
                  width: 200.w,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "TRACKING HONEY BY TRACEBEE",
                        style: headingStyle.copyWith(
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "TRACEBEE is a web application that offers efficient, timely, and user-friendly monitoring solutions with the goal of reshaping the beekeeping industry. Additionally, TRACEBEE is a platform for tracking the quantity of honey that is taken from the hives.",
                        style: subHeadingStyle.copyWith(fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CustomInfoContainer(
                image: "assets/images/home_image.png",
                title: "STINGLESS BEE HONEY",
                desc: "Information of honey from stingless Bess.",
                color: Color(0xff595791),
              ),
              CustomInfoContainer(
                image: "assets/images/info.png",
                title: "ABOUT US",
                desc: "Information about TraceBee Webapp",
                color: Color(0xff68CE58),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CustomInfoContainer(
                image: "assets/images/home_image.png",
                title: "TRACK",
                desc:
                    "Tracking the amount of Honey collected from various Hives.",
                color: Color(0xffA58E3C),
              ),
              CustomInfoContainer(
                image: "assets/images/hive.png",
                title: "HIVES",
                desc: "Information of all Hives",
                color: Color(0xff6CC5CB),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
