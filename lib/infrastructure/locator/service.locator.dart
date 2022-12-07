import 'package:ciat_inventory/ui/platform/dialog/dialogs.service.dart';
import 'package:ciat_inventory/ui/platform/messages/messages.service.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Infrastructure Services
  serviceLocator.registerSingleton(MessagesService());
  serviceLocator.registerSingleton(DialogsService());
}
