import 'package:ciat_inventory/domain/accession/model/accession.model.dart';
import 'package:ciat_inventory/styles/color.styles.dart';
import 'package:flutter/material.dart';

class AccessionFormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _current = Accession.empty();
  final  Function(Accession toSave) onSave;

  AccessionFormScreen({required this.onSave, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Nueva Accesion:', style: TextStyle(color: ColorStyles.accentColor, fontSize: 20, fontWeight: FontWeight.bold ),),
        Divider(),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only( right: 40 ),
                    child: Text('Codigo:'),
                  ),
                  Expanded(child: TextFormField(
                    validator: (value) => value == null || value == '' ? 'Ingrese el codigo' : null,
                    onSaved: (value) => _current.code = value!,
                  ))
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text('Año:'),
                  ),
                  Expanded(child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value == '' ? 'Ingrese el año' : null,
                    onSaved: (value) => _current.year = value!,
                  ))
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('Inventario:'),
                  ),
                  Expanded(child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || int.parse(value) <= 0 ? 'Ingrese el inventario' : null,
                    onSaved: (value) => _current.invQuantity = int.parse( value! ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only( top: 15),
                child: ElevatedButton.icon(
                  onPressed: () => onSave.call( this._current ),
                  icon: Icon(Icons.save),
                  label: Text('Guardar', style: TextStyle(color: Colors.white)
                )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
