import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCG9ZPMdA5i2KnshYWknj78s8yKvxs1x30",
            authDomain: "alianza-b7y88v.firebaseapp.com",
            projectId: "alianza-b7y88v",
            storageBucket: "alianza-b7y88v.appspot.com",
            messagingSenderId: "1021628575366",
            appId: "1:1021628575366:web:d5436bebec77569ab7eb07"));
  } else {
    await Firebase.initializeApp();
  }
}
