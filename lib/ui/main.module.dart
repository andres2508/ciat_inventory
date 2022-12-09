import 'package:ciat_inventory/ui/home/home.screen.dart';
import 'package:ciat_inventory/ui/main.screen.dart';
import 'package:ciat_inventory/ui/platform/ciat.module.dart';
import 'package:ciat_inventory/ui/platform/router.model.dart';

class MainModule extends CIATViewModule {
  @override
  List<CIATRoute> routes() {
    return [
      CIATRoute('login', (s) => (_) => MainScreen()),
      CIATRoute('home', (s) => (_) => HomeScreen())
    ];
  }

}