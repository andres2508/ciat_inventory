import 'package:ciat_inventory/app.dart';
import 'package:ciat_inventory/firebase_options.dart';
import 'package:ciat_inventory/infrastructure/locator/service.locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(CIATMobileApp());
}
