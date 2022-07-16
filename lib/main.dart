import 'package:finnapp/app.dart';
import 'package:finnapp/util/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //APPLICATION ONLY ON VERTICAL ORIENTATION
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final initialRoute = await AppUtil().getInitialRoute();
  //RUN APP
  runApp(App(initialRoute: initialRoute));
}
