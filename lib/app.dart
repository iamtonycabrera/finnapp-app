import 'package:flutter/material.dart';
import 'package:finnapp/constants/route_constant.dart';
import 'package:finnapp/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.initialRoute}) : super(key: key);
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: initialRoute,
      routes: RouteConstants.ALL_ROUTES,
      supportedLocales: L10n.all,
      theme: ThemeData(
          fontFamily: 'Grotesk',
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
