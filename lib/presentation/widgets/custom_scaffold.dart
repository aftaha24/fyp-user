import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:traceebee_users_app/presentation/auth-screen/login_screen.dart';
import 'package:traceebee_users_app/presentation/hive-screens/hive_analysis.dart';
import 'package:traceebee_users_app/presentation/hive-screens/hive_screen.dart';
import 'package:traceebee_users_app/presentation/home-screen/about_us_screen.dart';
import 'package:traceebee_users_app/presentation/home-screen/home_screen.dart';
import 'package:traceebee_users_app/presentation/home-screen/stingless_bee_info_screen.dart';
import 'package:traceebee_users_app/presentation/home-screen/track_screen.dart';
import 'package:traceebee_users_app/providers/home-provider/home_provider.dart';
import 'package:traceebee_users_app/services/local_service.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, child) {
        return Scaffold(
          backgroundColor: greenColor,
          bottomNavigationBar: Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            color: lightskinColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONTACT US",
                      style: headingStyle.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Jln. UIAM, 53100, Selangor, Malaysia",
                      style: subHeadingStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      height: 70.h,
                      width: MediaQuery.of(context).size.width,
                      color: skinColor,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "TRACEBEE",
                                style: headingStyle,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  homeState.setMenuState();
                                },
                                child: Icon(
                                  Icons.menu,
                                  size: 40.w,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    body!,
                  ],
                ),
              ),
              homeState.menuState == MenuState.opened
                  ? Positioned(
                      top: 75.h,
                      right: 20.w,
                      child: Container(
                        height:
                            homeState.hivesMenuState == HivesMenuState.closed
                                ? 400.h
                                : 450.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      homeState.setMenuState();
                                    },
                                    child: Icon(
                                      Icons.menu,
                                      size: 40.w,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Home",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const StingLessBeeInfoScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "STINGLESS BEE HONEY",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  homeState.setHivesMenuState();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    homeState.hivesMenuState ==
                                            HivesMenuState.closed
                                        ? Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Colors.black,
                                            size: 30.w,
                                          )
                                        : Icon(
                                            Icons.keyboard_arrow_up_outlined,
                                            color: Colors.black,
                                            size: 30.w,
                                          ),
                                    Text(
                                      "HIVES",
                                      style: headingStyle.copyWith(
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              homeState.hivesMenuState == HivesMenuState.opened
                                  ? Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    const HiveScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 30.h,
                                            width: 130.w,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffD9D9D9),
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "NEW HIVES",
                                                style: subHeadingStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Container(
                                          height: 30.h,
                                          width: 130.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffD9D9D9),
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "MY HIVES",
                                              style: subHeadingStyle,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const TrackScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "TRACK",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const HiveAnalysisScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "HIVE ANALYSIS",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const AboutUsScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "ABOUT",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  LocalService().removeSharedService();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                }),
                                child: Text(
                                  "LOG OUT",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
