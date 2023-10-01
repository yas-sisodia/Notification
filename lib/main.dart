import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification/api/firebase_api.dart';
import 'package:notification/firebase_options.dart';
import 'package:notification/pages/home_page.dart';
import 'package:notification/pages/notification_page.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_page' :(context) => NotificationPage()
      },
    );
  }
}
