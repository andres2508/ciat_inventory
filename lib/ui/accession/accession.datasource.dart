import 'package:ciat_inventory/domain/accession/model/accession.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AccessionDataSource extends DataGridSource {
  List<DataGridRow> _accessions = [];
  
  AccessionDataSource({required List<Accession> data}) {
    this._accessions = data.map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'code', value: e.code),
      DataGridCell<String>(columnName: 'year', value: e.year),
      DataGridCell<int>(columnName: 'invQuantity', value: e.invQuantity)
    ])).toList();
  }
  
  @override
  List<DataGridRow> get rows => _accessions;
  
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList()
    );
  }
}