// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:traceebee_users_app/utlis/text_styles.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    Key? key,
    this.hintText,
    this.controller,
    this.isObscure = false,
    this.onTap,
    this.keyboardType = TextInputType.name,
    this.readOnly = false,
  }) : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final bool readOnly;
  bool isObscure;
  final Function()? onTap;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 300.w,
      child: TextFormField(
        obscureText: isObscure,
        keyboardType: keyboardType,
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        style: subHeadingStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.sp),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
          hintText: hintText,
          hintStyle: subHeadingStyle.copyWith(fontSize: 20.sp),
        ),
      ),
    );
  }
}
