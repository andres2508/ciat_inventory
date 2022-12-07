import 'package:ciat_inventory/ui/platform/router.model.dart';

abstract class CIATViewModule {
  List<CIATViewModule> imports() {
    return [];
  }

  List<CIATRoute> routes();
}