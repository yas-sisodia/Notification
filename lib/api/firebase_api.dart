import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification/main.dart';

class FirebaseApi {
  //creating instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notification
  Future<void> initNotifications() async {
    //request permission from user (will prompt user)\
    await _firebaseMessaging.requestPermission();

    //fetch the FCM token from this device
    final fCMToken = await _firebaseMessaging.getToken();
    //print the token (Normally we are required to send this token to the server)
    log(fCMToken.toString());
    initPushNotifications();
  }

  //function to handle received messages
  void handleMessages(RemoteMessage?  message){
    if(message == null){
      return;
    }
    else{
      navigatorKey.currentState?.pushNamed('/notification_page',
      arguments: message
      );
    }
  }
  //function to initialize background settings
  Future initPushNotifications()async{
    //handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessages);


    // attach event listener for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }
}
