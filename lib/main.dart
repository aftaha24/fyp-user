import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:traceebee_users_app/firebase_options.dart';
import 'package:traceebee_users_app/presentation/auth-screen/login_screen.dart';
import 'package:traceebee_users_app/providers/providers.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        child: const LoginScreen(),
      ),
    );
  }
}
