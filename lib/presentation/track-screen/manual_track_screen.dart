import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_textfield.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class ManualTrackScreen extends StatelessWidget {
  const ManualTrackScreen({super.key});

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
          Container(
            height: 400.h,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffffee95),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "TRACK HONEY",
                  style: headingStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 260.w,
                  child: Text(
                    "Please fill out the form to enter collected information of honey.",
                    style: subHeadingStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      const CustomTextfield(
                        hintText: 'Hive Number  *',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomTextfield(
                        hintText: 'Date of Collection  *',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomTextfield(
                        hintText: 'Amount of Honey Collected  *',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        backgroundColor: Colors.white,
                        child: SizedBox(
                          height: 400,
                          width: 200,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              SizedBox(
                                width: 250.w,
                                child: Text(
                                  "HONEY AMOUNTSUCCESSFULLY ADDED",
                                  style: headingStyle.copyWith(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 60.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffABCDEC),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Return",
                                      style: subHeadingStyle.copyWith(
                                        color: const Color(0xff0500FF),
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 40.h,
                    width: 320.w,
                    color: darkgreenColor,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: headingStyle.copyWith(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
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
