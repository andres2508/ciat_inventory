import 'package:ciat_inventory/styles/color.styles.dart';
import 'package:ciat_inventory/ui/login/login.view.model.dart';
import 'package:ciat_inventory/ui/main.module.dart';
import 'package:ciat_inventory/ui/platform/ciat.module.dart';
import 'package:ciat_inventory/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<CIATViewModule> modules = [
  MainModule(),
];

class CIATMobileApp extends StatefulWidget {
  const CIATMobileApp({Key? key}) : super(key: key);

  @override
  State<CIATMobileApp> createState() => _CIATMobileAppState();
}

class _CIATMobileAppState extends State<CIATMobileApp> {
  final CIATRouter _router = CIATRouter();
  final _theme = ThemeData(
      appBarTheme: AppBarTheme(color: ColorStyles.accentColor),
      primaryColor: ColorStyles.accentColor,
      primaryColorDark: ColorStyles.accentColor,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 20.0),
        bodyText2: TextStyle(fontSize: 18.0),
        button: TextStyle(fontSize: 20.0),
        // subtitle1: const TextStyle( color: ColorStyles.accentColor ),
        // subtitle2: const TextStyle( color: ColorStyles.accentColor )
      )
  );

  @override
  void initState() {
    super.initState();
    for (final module in modules) {
      _router.addRoutes( module.routes() );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(),
      child: MaterialApp(
        title: 'CIAT Flutter',
        debugShowCheckedModeBanner: false,
        theme: _theme,
        onGenerateRoute: _router.generateRoute,
        initialRoute: 'login',
      ),
    );
  }
}
