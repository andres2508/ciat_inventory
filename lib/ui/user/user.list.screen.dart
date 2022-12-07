import 'package:ciat_inventory/model/user/users.model.dart';
import 'package:ciat_inventory/ui/common/future_wrapper.widget.dart';
import 'package:ciat_inventory/ui/common/view.model.consumer.dart';
import 'package:ciat_inventory/ui/user/user.tile.widget.dart';
import 'package:ciat_inventory/ui/user/user.view.model.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<UserViewModel>(
        builder: (context, model, _) {
          return FutureWrapperWidget(
              future: model.loadUsers,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Expanded(child: _userList())
                  ],
                );
              }
          );
        }
    );
  }

  Widget _userList() {
    return ViewModelConsumer<UserViewModel>(
      builder: (context, model, _) {
        return ListView.separated(
            itemBuilder: (_, index) {
              User user = model.users[index];
              return UserTile( user );
            },
            separatorBuilder: (_, index) => Divider(),
            itemCount: model.users.length
        );
      },
    );
  }
}
