import 'package:epidemic/models/ProvinceDesc.dart';
import 'package:flutter/material.dart';

class ProvinceDescTable extends StatelessWidget {
  late List<ProvinceDesc> provinceDescList;
  ProvinceDescTable(this.provinceDescList);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: buildTable(context),
      )
    );
  }

  Widget buildTable(BuildContext context) {
    // TODO: implement build
    return DataTable(
      headingTextStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Colors.black),
      headingRowHeight: 50,
      columns: [
        DataColumn(label: Text('地区')),
        DataColumn(label: Text('累计确诊'), numeric: true),
        DataColumn(label: Text('死亡'), numeric: true),
        DataColumn(label: Text('治愈'), numeric: true)
      ],

      rows: provinceDescList.map((province) => DataRow(cells: [
        DataCell(Text(province.name, softWrap: true,)),
        DataCell(Text(province.totalConfirmed.toString())),
        DataCell(Text(province.totalDeath.toString())),
        DataCell(Text(province.totalCured.toString()))
      ])).toList(),
    );
  }
}
