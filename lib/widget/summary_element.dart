import 'package:flutter/material.dart';
import 'package:tarea6/Model/element.dart';
import 'package:tarea6/widget/web_view.dart';

class SummaryElement extends StatelessWidget {
  static const routerName = "/summary";
  const SummaryElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Elements args =
        ModalRoute.of(context)?.settings.arguments as Elements;
    const TextStyle titleSection = TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
        actions:<Widget>[IconButton(
          onPressed: () {
              Navigator.pushNamed(context, WikipediaView.routerName, arguments: args.source);
          }, 
          icon: const Icon( Icons.open_in_browser))
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(10), children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child:  Text.rich(TextSpan( 
            text: 'Summary: \n',
            style: titleSection,
            children: <TextSpan>[
              TextSpan(
                text: args.summary,
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
            ]
          ),
        )),
        PaginatedDataTable(
          header: const Text("Property", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            columnSpacing: MediaQuery.of(context).size.width /24,
            rowsPerPage: 6,
            columns: const [
              DataColumn(label: Text("Property")),
              DataColumn(label: Text("Value"))
            ],
            source: _DataSource(context, args)
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child:  Text.rich(TextSpan(
            text: 'Electron Configuration: \n',
            style:  titleSection,
            children: <TextSpan>[
              TextSpan(
                text: args.electronConfiguration,
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20, wordSpacing: 12, color: Colors.blueAccent),
              ),
            ]
          ),
        )),
         Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child:  Text.rich(TextSpan(
            text: 'Electron Configuration Semantic: \n',
            style:  titleSection,
            children: <TextSpan>[
              TextSpan(
                text: args.electronConfigurationSemantic,
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20, wordSpacing: 12, color: Colors.blueAccent),
              ),
            ]
          ),
        )),
         Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child:  Text.rich(TextSpan(
            text: 'Electron Affinity \n',
            style:  titleSection,
            children: <TextSpan>[
              TextSpan(
                text: args.electronAffinity.toString(),
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20, wordSpacing: 12, color: Colors.blueAccent),
              ),
            ]
          ),
        )),
         Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child:  Text.rich(TextSpan(
            text: 'Electronegativity Pauling \n',
            style:  titleSection,
            children: <TextSpan>[
              TextSpan(
                text: args.electronegativityPauling.toString(),
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20, wordSpacing: 12, color: Colors.blueAccent),
              ),
            ]
          ),
        )),
         Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child:  Text.rich(TextSpan(
            text: 'Ionization Energies \n',
            style:  titleSection,
            children: <TextSpan>[
              TextSpan(
                text: args.ionizationEnergies.toString(),
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20, wordSpacing: 12, color: Colors.blueAccent),
              ),
            ]
          ),
        )),
      ]),
    );
  }
}

class _Row {
  _Row(
    this.valueA,
    this.valueB,
  );

  final String valueA;
  final String valueB;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  late List<_Row> _rows;
  final BuildContext context;
  final Elements e;

  _DataSource(this.context, this.e) {
    _rows = <_Row>[
      _Row('Name', e.name),
      _Row('Symbol', e.symbol),
      _Row('Category', e.category),
      _Row('Appearance', e.appearance),
      _Row('Atomic Mass', e.atomicMass.toString()),
      _Row('Boli', e.boil.toString()),
      _Row('Color', e.color),
      _Row('Density', e.density.toString()),
      _Row('Discovered By', e.discoveredBy),
      _Row('Melt', e.melt.toString()),
      _Row('Molar Heat', e.molarHeat.toString()),
      _Row('Named By', e.namedBy),
      _Row('Number', e.number.toString()),
      _Row('Period', e.period.toString()),
      _Row('Phase', e.phase),
      _Row('X Pos', e.xpos.toString()),
      _Row('Y Pos', e.ypos.toString()),
      _Row('Shells', e.shells.toString()),
    ];
  }

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(row.valueA)),
        DataCell(Text(row.valueB)),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
