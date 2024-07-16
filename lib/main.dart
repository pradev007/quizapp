import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Routes/app_route_config.dart';
import 'package:quizapp/firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // debugPaintSizeEnabled = true; // Enable visual debugging
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: myRouter.routerDelegate,
      routeInformationParser: myRouter.routeInformationParser,
      routeInformationProvider: myRouter.routeInformationProvider,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primaryContainer: Color(0xFF40206E),
          secondaryContainer: Color(0xFF0F5257),
          // Secondary Color: #03DAC6
          // Secondary Variant: #018786
          // Background Color: #FFFFFF
          // Surface Color: #F5F5F5
          // Error Color: #B00020
          // On Primary: #FFFFFF
          // On Secondary: #000000
          surface: Color(0xFFB3B0B0),
          outline: Color.fromARGB(255, 61, 206, 104),

          // On Surface: #000000
        ),
      ),

      // home: HomePage(),
    );
  }
}


//- Success! Use this token to login on a CI server:

//- 1//0gNiRhSetacI0CgYIARAAGBASNwF-L9IrjDg2OEtxDs46EROJ4868NZa29ofdJEI6MdIhu40UIih7h3G4e6XNAlGGVnv4l1Oz3n8

//- Example: firebase deploy --token "$FIREBASE_TOKEN"