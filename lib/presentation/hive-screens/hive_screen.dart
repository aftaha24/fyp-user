import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_users_app/presentation/hive-screens/add_hive_screen.dart';
import 'package:traceebee_users_app/presentation/home-screen/beekeepers_info_screen.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class HiveScreen extends StatelessWidget {
  const HiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/hive_screen.png',
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddHiveScreen(),
                ),
              );
            },
            child: Container(
              color: lightgreenColor,
              width: MediaQuery.of(context).size.width,
              height: 500.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 80.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.r),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/user3.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "New Hive",
                    style: subHeadingStyle,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BeeKeepersInfoScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 80.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.r),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/user4.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "My Hive",
                    style: subHeadingStyle,
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
