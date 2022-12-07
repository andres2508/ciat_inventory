import 'package:ciat_inventory/styles/color.styles.dart';
import 'package:ciat_inventory/ui/main.module.dart';
import 'package:ciat_inventory/ui/platform/ciat.module.dart';
import 'package:ciat_inventory/ui/router.dart';
import 'package:ciat_inventory/ui/user/user.view.model.dart';
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
      // primarySwatch: MaterialColor(ColorStyles.accentColor.value, const <int, Color>{
      //   50: Color.fromRGBO(43, 97, 49, 0.1),
      //   100: Color.fromRGBO(43, 97, 49, 0.2),
      //   200: Color.fromRGBO(43, 97, 49, 0.3),
      //   300: Color.fromRGBO(43, 97, 49, 0.4),
      //   400: Color.fromRGBO(43, 97, 49, 0.5),
      //   500: Color.fromRGBO(43, 97, 49, 0.6),
      //   600: Color.fromRGBO(43, 97, 49, 0.7),
      //   700: Color.fromRGBO(43, 97, 49, 0.8),
      //   800: Color.fromRGBO(43, 97, 49, 0.9),
      //   900: Color.fromRGBO(43, 97, 49, 1),
      // },
      // ),
      textTheme: TextTheme(
          subtitle1: const TextStyle( color: ColorStyles.accentColor ),
          subtitle2: const TextStyle( color: ColorStyles.accentColor )
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
    return ChangeNotifierProvider<UserViewModel>(
      create: (_) => UserViewModel(),
      child: MaterialApp(
        title: 'CIAT Flutter',
        debugShowCheckedModeBanner: false,
        theme: _theme,
        onGenerateRoute: _router.generateRoute,
        initialRoute: 'home',
      ),
    );
  }
}
