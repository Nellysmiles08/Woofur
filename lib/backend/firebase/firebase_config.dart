import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCOhBQm5iMOp_7TQJg6iIz7eHAlwuyg708",
            authDomain: "woo-fur-beta-app-9nht1k.firebaseapp.com",
            projectId: "woo-fur-beta-app-9nht1k",
            storageBucket: "woo-fur-beta-app-9nht1k.appspot.com",
            messagingSenderId: "751841220436",
            appId: "1:751841220436:web:80825774e4dff65fb91ac1"));
  } else {
    await Firebase.initializeApp();
  }
}
