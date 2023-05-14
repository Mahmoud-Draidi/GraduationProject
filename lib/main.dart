import 'package:flutter/material.dart';
import 'package:mowasulatuna/providers/input_box_provider.dart';
import 'package:mowasulatuna/providers/sned_code_provider.dart';
import 'package:mowasulatuna/screens/common_screens/easy_booking_screen.dart';
import 'package:mowasulatuna/screens/common_screens/easy_screen.dart';
import 'package:mowasulatuna/screens/common_screens/know_screen.dart';
import 'package:mowasulatuna/screens/common_screens/logo_screen.dart';
import 'package:mowasulatuna/screens/common_screens/sign_in_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InputBoxProvider()),
        ChangeNotifierProvider(create: (_) => SendCodeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LogoScreen(),
    );
  }
}
