// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:traceebee_users_app/presentation/auth-screen/login_screen.dart';
import 'package:traceebee_users_app/presentation/home-screen/home_screen.dart';
import 'package:traceebee_users_app/providers/providers.dart';
import 'package:traceebee_users_app/services/local_service.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  bool isLoggedIn =
      await LocalService().getSharedToken() == null ? false : true;
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: List.from(providers),
      child: ScreenUtilInit(
        designSize: const Size(375, 720),
        builder: (context, child) {
          return MaterialApp(
            title: 'TraceeBee User',
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
