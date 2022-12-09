import 'package:ciat_inventory/domain/accession/infrastructure/accession.repository.dart';
import 'package:ciat_inventory/domain/accession/model/accession.model.dart';
import 'package:uuid/uuid.dart';

class AccessionAppService {
  final AccessionRepository _repository = AccessionRepository.repository;

  Future<Accession> save(Accession request) {
    if ( !request.isPersistent() ) {
      request.setId( Uuid().v4() );
    }
    return _repository.save( request );
  }

  Future<List<Accession>> findAll() {
    return _repository.findAll();
  }
}