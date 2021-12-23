import 'package:epidemic/models/AbroadDesc.dart';
import 'package:flutter/material.dart';

class AbroadDescTable extends StatelessWidget {
  late AbroadDesc abroadDesc;
  AbroadDescTable(this.abroadDesc);


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
    var tableItems = abroadDesc.newslist;
    return DataTable(
        headingRowHeight: 50,
        headingTextStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Colors.black),
        columns: [
          DataColumn(label: Text('地区')),
          DataColumn(label: Text('累计确诊'), numeric: true),
          DataColumn(label: Text('累计死亡'), numeric: true),
          DataColumn(label: Text('死亡率'), numeric: true)
        ],
      rows: tableItems.map((item) => DataRow(cells: [
        DataCell(Text(item.provinceName, softWrap: true,)),
        DataCell(Text(item.confirmedCount.toString(), textAlign: TextAlign.right,)),
        DataCell(Text(item.deadCount.toString(), textAlign: TextAlign.right,)),
        DataCell(Text(((item.deadCount / item.confirmedCount) * 100)
            .toStringAsFixed(2) + "%", textAlign: TextAlign.right,)),
      ])).toList(),

    );
  }

}