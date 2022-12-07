import 'package:ciat_inventory/model/user/user.repository.dart';
import 'package:ciat_inventory/model/user/users.model.dart';
import 'package:ciat_inventory/ui/common/base.view.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository _repository = UserRepository.repository;

  List<User> _users = [];

  get users => _users;

  Future<void> loadUsers() async {
    final testing = await FirebaseFirestore.instance.collection( 'users' ).get();
    testing.docs.forEach((element) => print( element['name'] ) );
    this._users = await this._repository.findAll();
    notifyUI();
    notifyListeners();
  }

  User createNewUser() {
    return User(users.length, '', '');
  }

  Future<void> saveUser(User user) async {
    await this._repository.save( user );
    await this.loadUsers();
  }
}