import 'package:ciat_inventory/infrastructure/database/database.repository.dart';
import 'package:ciat_inventory/model/user/users.model.dart';

class UserRepository extends DBRepository<User> {
  static final UserRepository repository = UserRepository._intern();

  UserRepository._intern(): super('Users');

  Future<List<User>> findAll() async {
    final db = await this.database;
    var result = await db.query( this.tableName );
    var map = result.map((it) => User.fromMap( it ) ).toList();
    return Future.value( map );
  }
}