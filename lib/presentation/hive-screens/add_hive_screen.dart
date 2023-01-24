import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:traceebee_users_app/models/hive_model.dart';
import 'package:traceebee_users_app/presentation/home-screen/beekeepers_info_screen.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_textfield.dart';
import 'package:traceebee_users_app/services/firestore_service.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

import '../../utlis/utility.dart';

class AddHiveScreen extends StatefulWidget {
  const AddHiveScreen({super.key});

  @override
  State<AddHiveScreen> createState() => _AddHiveScreenState();
}

class _AddHiveScreenState extends State<AddHiveScreen> {
  late TextEditingController hiveNumberController;
  late TextEditingController locationController;
  late TextEditingController createdAtController;
  late TextEditingController gdriveLinkController;
  String location = 'Null, Press Button';
  String address = 'search';
  bool isLoading = false;
  Position? _currentPosition;

  @override
  void initState() {
    hiveNumberController = TextEditingController();
    locationController = TextEditingController();
    createdAtController = TextEditingController();
    gdriveLinkController = TextEditingController();
    super.initState();
  }

  void clearTextFields() {
    hiveNumberController.clear();
    locationController.clear();
    createdAtController.clear();
    gdriveLinkController.clear();
  }

  bool validate() {
    if (hiveNumberController.text.isEmpty &&
        locationController.text.isEmpty &&
        createdAtController.text.isEmpty &&
        gdriveLinkController.text.isEmpty) {
      showSnackBar(context, text: 'Please fill all fields');
      return false;
    } else {
      return true;
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void addHive() async {
    setState(() => isLoading = true);
    if (validate()) {
      log(FirebaseAuth.instance.currentUser!.uid);
      var userDoc = await FireStoreService()
          .getUserProfile(FirebaseAuth.instance.currentUser!.uid);

      log(userDoc.data().toString());

      HiveModel hiveModel = HiveModel(
        hiveNumber: hiveNumberController.text,
        createdAt: createdAtController.text,
        driveLink: gdriveLinkController.text,
        location: locationController.text,
        userID: FirebaseAuth.instance.currentUser!.uid,
        userName: userDoc.data()!['name'],
        amountHoney: '0',
      );

      await FireStoreService().addHiveData(hiveModel);
      setState(() => isLoading = false);
      await showDialog(
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
                        clearTextFields();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BeeKeepersInfoScreen(),
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
                        clearTextFields();
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
    }
    setState(() => isLoading = false);
  }

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
                CustomTextfield(
                  hintText: 'Hive Number  *',
                  controller: hiveNumberController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextfield(
                  hintText: 'Location  *',
                  controller: locationController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextfield(
                  hintText: 'Creation Date  *',
                  controller: createdAtController,
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
                  readOnly: true,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextfield(
                  hintText: 'Google Drive URL *',
                  controller: gdriveLinkController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                Text('LNG: ${_currentPosition?.longitude ?? ""}'),
                ElevatedButton(
                  onPressed: _getCurrentPosition,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Get Current Location",
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            onTap: () => addHive(),
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
    );
  }
}
