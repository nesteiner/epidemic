import 'package:epidemic/models/Overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  late Overview overview;
  OverviewCard(this.overview);


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 240
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: buildGrid(context),
        )
      )
    );
  }

  Widget buildGrid(BuildContext context) {
    List<Widget> widgets = [];
    if(overview.confirmedIncr == null) {
      widgets = [
          buildOne(context, '现存确诊', overview.currentConfirmedCount, Colors.red),
          buildOne(context, '境外输入', overview.suspectedCount, Colors.orange),
          buildOne(context, '现存无症状', overview.seriousCount, Colors.brown),
          buildOne(context, '累计确诊', overview.confirmedCount, Colors.red),
          buildOne(context, '累计死亡', overview.deadCount, Colors.blueGrey),
          buildOne(context, '累计确诊', overview.curedCount, Colors.green),
      ];
    } else {
      widgets = [
          buildOneWithIncr(context, '现存确诊', overview.currentConfirmedCount, overview.currentConfirmedIncr!, Colors.red),
          buildOneWithIncr(context, '境外输入', overview.suspectedCount, overview.suspectedIncr!, Colors.orange),
          buildOneWithIncr(context, '现存无症状', overview.seriousCount, overview.seriousIncr!, Colors.brown),
          buildOneWithIncr(context, '累计确诊', overview.confirmedCount, overview.confirmedIncr!, Colors.red),
          buildOneWithIncr(context, '累计死亡', overview.deadCount, overview.deadIncr!, Colors.blueGrey),
          buildOneWithIncr(context, '累计确诊', overview.curedCount, overview.curedIncr!, Colors.green),
      ];
    }


    return GridView.count(
      crossAxisCount: 3,
      children: widgets,
    );
  }

  Widget buildOne(BuildContext context, String field, int count, Color color) {
    return Column(
      children: [
        Text(count.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: color),),
        Text(field, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),)
      ],
    );
  }

  Widget buildOneWithIncr(BuildContext context, String field, int count, int incr, Color color) {
    var text = Text.rich(TextSpan(
        children: [
          TextSpan(
              text: "较昨日",
              style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)
          ),

          TextSpan(
              text: incr > 0 ? "+" + incr.toString() : incr.toString(),
              style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500)
          )
        ]
    ));

    return Column(
      children: [
        text,
        buildOne(context, field, count, color)
      ],
    );

  }
}