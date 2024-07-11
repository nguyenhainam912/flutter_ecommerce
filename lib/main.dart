import 'package:ecommt/app.dart';
import 'package:ecommt/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommt/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  /// add widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// local storage
  await GetStorage.init();

  /// await splash until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}
