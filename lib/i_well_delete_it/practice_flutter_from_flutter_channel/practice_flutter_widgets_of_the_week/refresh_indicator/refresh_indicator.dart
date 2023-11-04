import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/i_well_delete_it/practice_flutter_from_flutter_channel/practice_flutter_widgets_of_the_week/generat_custom_list_view.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _refreshIndicator(context),
    ));
  }

  RefreshIndicator _refreshIndicator(BuildContext context) {
    return RefreshIndicator(
        edgeOffset: 40,
        displacement: 150,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: generateCustomListView(),
        onRefresh: () async {
          showSnakBar(context, "refreshing...");
        });
  }

}
