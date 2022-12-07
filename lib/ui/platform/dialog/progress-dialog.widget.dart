import 'package:ciat_inventory/infrastructure/locator/service.locator.dart';
import 'package:ciat_inventory/ui/platform/dialog/dialogs.service.dart';
import 'package:flutter/material.dart';

class ProgressDialogWrapper extends StatelessWidget {
  final WidgetBuilder builder;

  ProgressDialogWrapper({required this.builder});

  @override
  Widget build(BuildContext context) {
    serviceLocator<DialogsService>().changeContext(context);
    return builder(context);
  }
}
