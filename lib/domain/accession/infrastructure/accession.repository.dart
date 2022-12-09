import 'package:ciat_inventory/domain/accession/model/accession.model.dart';
import 'package:ciat_inventory/infrastructure/database/database.repository.dart';

class AccessionRepository extends DBRepository<Accession> {
  static final AccessionRepository repository = AccessionRepository._intern();

  AccessionRepository._intern(): super( 'accessions', (json) => Accession.fromJson(json) );
}