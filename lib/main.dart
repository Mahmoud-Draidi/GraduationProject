import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mowasulatuna/providers/book_provider_passenger.dart';
import 'package:mowasulatuna/providers/booking_process_provider.dart';
import 'package:mowasulatuna/providers/controllers_provider.dart';
import 'package:mowasulatuna/providers/input_box_provider.dart';
import 'package:mowasulatuna/providers/seat_provider.dart';
import 'package:mowasulatuna/providers/sign_in_screen_provider.dart';
import 'package:mowasulatuna/providers/sign_in_screen_provider.dart';
import 'package:mowasulatuna/providers/sign_up_screen_provider.dart';
import 'package:mowasulatuna/providers/sned_code_provider.dart';
import 'package:mowasulatuna/providers/user_type_provider.dart';
import 'package:mowasulatuna/screens/common_screens/easy_screen.dart';
import 'package:mowasulatuna/screens/common_screens/logo_screen.dart';
import 'package:mowasulatuna/screens/common_screens/map.dart';
import 'package:mowasulatuna/screens/common_screens/map2.dart';
import 'package:mowasulatuna/screens/common_screens/my_google_map.dart';
import 'package:mowasulatuna/screens/common_screens/sign_in_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/d_home.dart';
import 'package:mowasulatuna/screens/driver_screens/history_details.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/book_details.dart';
import 'package:mowasulatuna/screens/rider_screens/book_screen.dart';
import 'package:mowasulatuna/providers/timer_provider.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';
import 'screens/common_screens/edit_profile_screen.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

int? initScreen;

bool? isSignedIn;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Intro Screen First time opened or when reInstalled
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isSignedIn = false;
  } else {
    isSignedIn = true;
  }

  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InputBoxProvider()),
        ChangeNotifierProvider(create: (_) => SendCodeProvider()),
        ChangeNotifierProvider(create: (_) => SignInScreenProvider()),
        ChangeNotifierProvider(create: (_) => SignUpScreenProvider()),
        ChangeNotifierProvider(create: (_) => SeatProvider()),
        ChangeNotifierProvider(create: (_) => BookProviderPassenger()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
        ChangeNotifierProvider(create: (_) => ControllerProvider()),
        ChangeNotifierProvider(create: (_) => UserTypeProvider()),
        ChangeNotifierProvider(create: (_) => BookingProcessProvider()),
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
    final proType = Provider.of<UserTypeProvider>(context);
    return MaterialApp(
      title: 'مواصلاتنا',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null ? 'intro' : 'home',
      routes: {
        // Mustttttttttttttttttttttttt if driver or rider RHome() Or MyBus()
        'home' : isSignedIn == false ? (context) => SignInScreen() : (context) =>proType.isDriver?MyBus(): RHome(),
        'intro' : (context) => LogoScreen(),
      },
    );
  }
}
