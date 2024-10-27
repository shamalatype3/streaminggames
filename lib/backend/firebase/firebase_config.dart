import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA3xt6lpyOcgoCCZAUy0RFH3xOGNLdJ9pM",
            authDomain: "streamlocalsports.firebaseapp.com",
            projectId: "streamlocalsports",
            storageBucket: "streamlocalsports.appspot.com",
            messagingSenderId: "603127153713",
            appId: "1:603127153713:web:95a922bf5e1d6b13d5c110",
            measurementId: "G-FMLWCZVHRT"));
  } else {
    await Firebase.initializeApp();
  }
}
