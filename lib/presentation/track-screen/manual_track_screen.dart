import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:traceebee_users_app/models/honey_model.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_textfield.dart';
import 'package:traceebee_users_app/services/firestore_service.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';
import 'package:traceebee_users_app/utlis/utility.dart';

class ManualTrackScreen extends StatefulWidget {
  final String hiveNumber;
  final String createAt;
  const ManualTrackScreen(
      {super.key, required this.hiveNumber, required this.createAt});

  @override
  State<ManualTrackScreen> createState() => _ManualTrackScreenState();
}

class _ManualTrackScreenState extends State<ManualTrackScreen> {
  late TextEditingController hiveNumberController;
  late TextEditingController createdAtController;
  late TextEditingController amountHoneyController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    hiveNumberController = TextEditingController(
      text: widget.hiveNumber,
    );
    createdAtController = TextEditingController(
      text: widget.createAt,
    );
    amountHoneyController = TextEditingController();
  }

  bool validate() {
    if (hiveNumberController.text.isEmpty &&
        amountHoneyController.text.isEmpty &&
        createdAtController.text.isEmpty) {
      showSnackBar(context, text: 'Please fill all fields');
      return false;
    } else {
      return true;
    }
  }

  void clearTextFields() {
    hiveNumberController.clear();
    amountHoneyController.clear();
    createdAtController.clear();
  }

  void addHoney() async {
    if (validate()) {
      setState(() => isLoading = true);

      var honeyModel = HoneyModel(
          amountOfHoney: amountHoneyController.text,
          createdAt: createdAtController.text,
          hiveNumber: hiveNumberController.text,
          userID: FirebaseAuth.instance.currentUser!.uid);

      var res = await FireStoreService()
          .addHoneyData(honeyModel, hiveNumberController.text);

      clearTextFields();
      if (res == 'Success') {
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
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context, text: res);
      }
    }
    setState(() => isLoading = false);
  }

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
                      CustomTextfield(
                        hintText: 'Hive Number  *',
                        controller: hiveNumberController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextfield(
                        hintText: 'Date of Collection  *',
                        controller: createdAtController,
                        readOnly: true,
                        onTap: () async {
                          var time = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now()
                                  .subtract(const Duration(hours: 24 * 260)),
                              initialDate: DateTime.now(),
                              lastDate: DateTime.now()
                                  .add(const Duration(hours: 24 * 260)));
                          if (time != null) {
                            createdAtController.text =
                                DateFormat('dd/MM/yyyy').format(time);
                            setState(() {});
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextfield(
                        hintText: 'Amount of Honey Collected  *',
                        controller: amountHoneyController,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  onTap: () => addHoney(),
                  child: Container(
                    height: 40.h,
                    width: 320.w,
                    color: darkgreenColor,
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(
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
