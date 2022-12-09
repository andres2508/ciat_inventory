import 'package:ciat_inventory/infrastructure/database/persistent.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.model.g.dart';

@JsonSerializable()
class User extends PersistentEntity {
  String id;
  String name;
  UserType type;

  User(this.id, this.name, this.type);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  @override
  String getId() {
    return id;
  }
}

enum UserType {
  SENDER, RECEPTOR
}