import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_users_app/presentation/home-screen/beekeepers_info_screen.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_textfield.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class AddHiveScreen extends StatelessWidget {
  const AddHiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Text(
            "ADD A NEW HIVE",
            style: headingStyle,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Please fill out the form to add new Hive.",
            style: subHeadingStyle,
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const CustomTextfield(
                  hintText: 'Hive Number  *',
                ),
                SizedBox(
                  height: 30.h,
                ),
                const CustomTextfield(
                  hintText: 'Location  *',
                ),
                SizedBox(
                  height: 30.h,
                ),
                const CustomTextfield(
                  hintText: 'Creation Date  *',
                ),
                SizedBox(
                  height: 30.h,
                ),
                const CustomTextfield(
                  hintText: 'Google Drive URL *',
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
                          width: 210.w,
                          child: Text(
                            "NEW HIVE HAS BEEN CREATED",
                            style: headingStyle.copyWith(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 210.w,
                          child: Text(
                            "THANK YOU!",
                            style: headingStyle.copyWith(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff0500FF)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const BeeKeepersInfoScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 35.h,
                                width: 130.w,
                                color: Colors.black,
                                child: Center(
                                  child: Text(
                                    "My Hives",
                                    style: subHeadingStyle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 35.h,
                                width: 130.w,
                                color: Colors.black,
                                child: Center(
                                  child: Text(
                                    "Return",
                                    style: subHeadingStyle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
