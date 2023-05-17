import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mowasulatuna/providers/input_box_provider.dart';
import 'package:mowasulatuna/providers/sign_in_provider.dart';
import 'package:mowasulatuna/providers/sned_code_provider.dart';
import 'package:mowasulatuna/screens/common_screens/easy_booking_screen.dart';
import 'package:mowasulatuna/screens/common_screens/easy_screen.dart';
import 'package:mowasulatuna/screens/common_screens/know_screen.dart';
import 'package:mowasulatuna/screens/common_screens/logo_screen.dart';
import 'package:mowasulatuna/screens/common_screens/sign_in_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

int? initScreen;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Intro Screen First time opened or when reInstalled
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InputBoxProvider()),
        ChangeNotifierProvider(create: (_) => SendCodeProvider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

//HI obada mahmoud
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مواصلاتنا',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: initScreen == 0 || initScreen == null ? 'intro' : 'home',
      routes: {
        'home' : (context) => SignInScreen(),
        'intro' : (context) => EasyScreen(),
      },
    );
  }
}
