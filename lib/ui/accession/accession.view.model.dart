import 'package:ciat_inventory/domain/accession/app/accession.service.dart';
import 'package:ciat_inventory/domain/accession/model/accession.model.dart';
import 'package:ciat_inventory/infrastructure/locator/service.locator.dart';
import 'package:ciat_inventory/ui/common/base.view.model.dart';

class AccessionViewModel extends BaseViewModel {
  final AccessionAppService _service = serviceLocator<AccessionAppService>();

  List<Accession> _accessions = [];
  List<Accession> get accessions => _accessions;

  Future<void> loadAccessions() async {
    _accessions = await this._service.findAll();
    notifyUI();
    notifyListeners();
  }

  Future<void> save(Accession accession) async {
    await this._service.save( accession );
    await this.loadAccessions();
  }
}