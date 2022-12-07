import 'package:ciat_inventory/ui/main.screen.dart';
import 'package:ciat_inventory/ui/platform/ciat.module.dart';
import 'package:ciat_inventory/ui/platform/router.model.dart';
import 'package:ciat_inventory/ui/user/user.form.screen.dart';

class MainModule extends CIATViewModule {
  @override
  List<CIATRoute> routes() {
    return [
      CIATRoute('home', (s) => (_) => MainScreen()),
      CIATRoute('form', (s) => (_) => UserFormScreen() )
    ];
  }

}