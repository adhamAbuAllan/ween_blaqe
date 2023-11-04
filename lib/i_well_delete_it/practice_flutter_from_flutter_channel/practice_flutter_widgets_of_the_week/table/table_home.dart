import 'package:flutter/material.dart';

class TableHome extends StatelessWidget {
  const TableHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          defaultColumnWidth: const FlexColumnWidth(.10),
          columnWidths: const {
            0: FractionColumnWidth(.5),
            1: FractionColumnWidth(.2),
            2: FractionColumnWidth(.5),
            3: FractionColumnWidth(.5),
          },
          border: TableBorder.all(color: Colors.black38),
          children: const [
            TableRow(children: [WideWidget(), MediumWidget(), SmallWidget()]),
            TableRow(children: [WideWidget(), MediumWidget(), SmallWidget()]),
          ],
        ),
      ),
    );
  }
}

class WideWidget extends StatelessWidget {
  const WideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.amber,
    );
  }
}

class MediumWidget extends StatelessWidget {
  const MediumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    );
  }
}

class SmallWidget extends StatelessWidget {
  const SmallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.green.shade400,
    );
  }
}
