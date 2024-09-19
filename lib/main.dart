import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:app_patinha/src/app_patinha_perdida.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    const FirebaseOptions android = FirebaseOptions(
        apiKey: "AIzaSyBZVi5FAbSzIYs1FVrytVuhNcSWNFMfDFI",
        appId: "1:370667727955:android:c424f206aae0dbcb5faaa6",
        messagingSenderId: "370667727955",
        projectId: "app-patinha-28eef",
        storageBucket: "app-patinha-28eef.appspot.com");

    const FirebaseOptions ios = FirebaseOptions(
        apiKey: "AIzaSyBeQTgKyB_DN1qLFGIWVfcDDobKS_FPCTE",
        appId: "1:370667727955:ios:0f9ceb19767fde3a5faaa6",
        messagingSenderId: "370667727955",
        projectId: "app-patinha-28eef",
        storageBucket: "app-patinha-28eef.appspot.com");

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: Platform.isAndroid ? android : ios);

    runApp(
      const PatinhaPerdidaApp(),
    );
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}



