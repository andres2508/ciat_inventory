import 'package:ciat_inventory/styles/color.styles.dart';
import 'package:ciat_inventory/ui/accession/accession.datasource.dart';
import 'package:ciat_inventory/ui/accession/accession.form.dart';
import 'package:ciat_inventory/ui/accession/accession.view.model.dart';
import 'package:ciat_inventory/ui/common/view.model.consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AccessionListView extends StatefulWidget {
  const AccessionListView({Key? key}) : super(key: key);

  @override
  State<AccessionListView> createState() => _AccessionListViewState();
}

class _AccessionListViewState extends State<AccessionListView> {
  final AccessionViewModel _model = AccessionViewModel();

  @override
  void initState() {
    this._model.loadAccessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _model,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ACCESSIONES:'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showDialog(context: context, builder: (_) => _accessionForm() ),
        ),
        body: Column(
          children: [
            _indicators(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Accesiones Registradas:',
                style: TextStyle(
                  color: ColorStyles.accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),
              ),
            ),
            _listTable()
          ],
        ),
      ),
    );
  }

  Widget _indicators() {
    return ViewModelConsumer<AccessionViewModel>(
      builder: (context, model, _) {
        return Row(
          children: [
            Container(
              child: Text('Total de Registros: ${model.accessions.length}'),
            )
          ],
        );
      },
    );
  }

  Widget _listTable() {
    return ViewModelConsumer<AccessionViewModel>(
      builder: (context, model, _) {
        final dataSource = AccessionDataSource(data: model.accessions);
        return Expanded(
          child: SfDataGrid(
            columnWidthMode: ColumnWidthMode.fill,
            source: dataSource,
            columns: <GridColumn> [
              GridColumn(
                columnName: 'id',
                label: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Text('ID'),
                )
              ),
              GridColumn(
                  columnName: 'code',
                  label: Container(
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Text('CODIGO'),
                  )
              ),
              GridColumn(
                  columnName: 'year',
                  label: Container(
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Text('AÑO'),
                  )
              ),
              GridColumn(
                  columnName: 'invQuantity',
                  label: Container(
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Text('INVENTARIO'),
                  )
              ),
            ]
          ),
        );
      }
    );
  }

  Widget _accessionForm() {
    return AlertDialog(
      content: AccessionFormScreen(
        onSave: (accession) {
          _model.save( accession ).then((value) => Navigator.pop(context));
        },
      )
    );
  }
}
