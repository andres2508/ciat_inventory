import 'package:ciat_inventory/infrastructure/database/database.repository.dart';
import 'package:ciat_inventory/ui/user/users.model.dart';

class UserRepository extends DBRepository<User> {
  static final UserRepository repository = UserRepository._intern();

  UserRepository._intern(): super('users', (json) => User.fromJson(json) );
}