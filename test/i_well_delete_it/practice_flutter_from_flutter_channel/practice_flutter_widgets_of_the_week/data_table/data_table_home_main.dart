import 'package:flutter/material.dart';

main(){runApp(const MaterialApp(home:_Home()));}
class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(body: SafeArea(
          child: DataTable(
            sortAscending: true,
            sortColumnIndex: 0,
            columns: const [
            DataColumn(
                numeric: true,
                label: Text("name")),
            DataColumn(label: Text("year")),
          ],rows:  const [
            DataRow(cells: [
              DataCell(Text("dash")),
              DataCell(Text("2018")),
            ]),
            DataRow(

                cells: [

              DataCell(
            showEditIcon: true,
                  Text("dash"),
                placeholder: true

              ),
              DataCell(Text("2018")),
            ])
          ],),
        ),);
  }
}
