import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class TrackMenuWidget extends StatelessWidget {
  const TrackMenuWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});
  final String image;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: 100.w,
            child: Text(
              title,
              style: subHeadingStyle.copyWith(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
