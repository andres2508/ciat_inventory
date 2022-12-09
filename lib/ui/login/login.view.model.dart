import 'package:ciat_inventory/infrastructure/security/session/ciat.session.dart';
import 'package:ciat_inventory/ui/common/base.view.model.dart';
import 'package:ciat_inventory/ui/user/user.repository.dart';
import 'package:ciat_inventory/ui/user/users.model.dart';

class LoginViewModel extends BaseViewModel {
  final UserRepository _repository = UserRepository.repository;

  List<User> _users = [];

  List<User> get users => this._users;
  User get currentUser => this.currentUser!;

  Future<void> loadUsers() async {
    _users = await this._repository.findAll();
    notifyUI();
    notifyListeners();
  }

  void setCurrentUser(String userId) {
    CIATSession.setCurrentUser( _users.firstWhere((element) => element.id == userId) );
  }
}