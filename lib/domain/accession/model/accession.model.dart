import 'package:ciat_inventory/infrastructure/database/persistent.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accession.model.g.dart';

@JsonSerializable()
class Accession extends PersistentEntity {
  String? id;
  String code;
  String year;
  int invQuantity;

  Accession(this.id, this.code, this.year, this.invQuantity);

  @override
  Map<String, dynamic> toJson() => _$AccessionToJson(this);

  factory Accession.fromJson(Map<String, dynamic> json) =>
      _$AccessionFromJson(json);

  @override
  String getId() {
    return id!;
  }

  bool isPersistent() {
    return this.id != '';
  }

  void setId(String id) {
    this.id = id;
  }

  factory Accession.empty() => Accession(null, '', '', 0);
}