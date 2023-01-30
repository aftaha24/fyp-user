import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_users_app/presentation/auth-screen/login_screen.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_textfield.dart';
import 'package:traceebee_users_app/services/firebase_auth_service.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';
import 'package:traceebee_users_app/utlis/utility.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController cnfPasswordController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cnfPasswordController = TextEditingController();
  }

  bool validate() {
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty &&
        cnfPasswordController.text.isEmpty) {
      showSnackBar(context, text: 'Please fill all fields');

      return false;
    } else {
      if (passwordController.text != cnfPasswordController.text) {
        showSnackBar(context, text: 'Password did not matched');
        return false;
      }
      return true;
    }
  }

  void signup() async {
    if (validate()) {
      setState(() => isLoading = true);
      var res = await FirebaseAuthService().signUpUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (res == 'success') {
        setState(() => isLoading = false);
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
                      "REGISTRATION IS SUCCESSFUL",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40.h,
                      width: 200.w,
                      color: const Color(0xff4A71AC),
                      child: Center(
                        child: Text(
                          "Proceed to Login ->",
                          style: subHeadingStyle.copyWith(
                            color: Colors.white,
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
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context, text: res);
        // showSnackBar(context, text: 'Something went wrong');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: SingleChildScrollView(
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
                child: Text(
                  "TRACEBEE",
                  style: headingStyle,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "REGISTER",
              style: headingStyle,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Please include your information to register",
              style: subHeadingStyle,
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  CustomTextfield(
                    hintText: 'Enter your name',
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextfield(
                    hintText: 'Enter your email',
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextfield(
                    hintText: 'Enter your password',
                    controller: passwordController,
                    isObscure: true,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextfield(
                    hintText: 'Confirm your password',
                    controller: cnfPasswordController,
                    isObscure: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            InkWell(
              onTap: () => signup(),
              child: Container(
                height: 40.h,
                width: 320.w,
                color: darkgreenColor,
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          "Sign Up",
                          style: headingStyle.copyWith(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have an Account?",
                  style: subHeadingStyle,
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign in",
                    style: headingStyle.copyWith(fontSize: 15.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
