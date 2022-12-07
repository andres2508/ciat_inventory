import 'dart:convert';
import 'package:ciat_inventory/infrastructure/database/persisten.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.model.g.dart';

@JsonSerializable()
class User extends PersistenEntity {
  int id;
  String name;
  String cc;

  User(this.id, this.name, this.cc);

  static User fromMap(Map<String, dynamic> map) {
    return User(map['id'], map['name'], map['cc']);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  @override
  int getId() {
    return id;
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'id': id,
      'name': name,
      'cc': cc
    };
  }
}