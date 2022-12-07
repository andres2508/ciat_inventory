import 'package:ciat_inventory/model/user/users.model.dart';
import 'package:ciat_inventory/ui/common/view.model.consumer.dart';
import 'package:ciat_inventory/ui/user/user.view.model.dart';
import 'package:flutter/material.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late User user;

  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<UserViewModel>(
      builder: (context, model, _) {
        this.user = model.createNewUser();
        return Scaffold(
          appBar: AppBar(
            title: Text( 'Agregar Nuevo Usuario' ),
          ),
          body: Container(
            padding: EdgeInsets.all( 20 ),
            child: Form(
                key: _formKey,
                child: _userForm()
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if ( this._formKey.currentState!.validate() ) {
                this._formKey.currentState?.save();
                await model.saveUser( this.user );
                Navigator.pop(context);
              }
            },
            child: Icon( Icons.save, color: Colors.white, ),
          ),
        );
      }
    );
  }

  Widget _userForm() {
    return Column(
      children: [
        Row(
          children: [
            Text('Nombre:'),
            SizedBox(width: 30,),
            Expanded(
              child: TextFormField(
                initialValue: this.user.name,
                onSaved: (val) => this.user.name = val != null ? val : '',
              )
            )
          ],
        ),
        Row(
          children: [
            Text('C.C:'),
            SizedBox(width: 30),
            Expanded(
              child: TextFormField(
                initialValue: this.user.cc,
                onSaved: (val) => this.user.cc = val != null ? val : '',
              )
            )
          ],
        )
      ],
    );
  }
}
