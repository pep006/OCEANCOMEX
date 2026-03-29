import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: "AIzaSyDC285_Oj_mtccCiCHcca74txRn3rwoAHY", // Tu API Key
      appId: "1:373554259736:web:1c251265a20d148920a06d", // Tu App ID
      messagingSenderId: "373554259736", // Tu Sender ID
      projectId: "weboceancomex", // Tu Project ID
      authDomain: "weboceancomex.firebaseapp.com",
      storageBucket: "weboceancomex.firebasestorage.app",
    );
  }
}