import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [_SliverAppBar(), _CustomSliverList()],
      ),
    );
  }
}

class _SliverAppBar extends StatefulWidget {
  const _SliverAppBar();

  @override
  State<_SliverAppBar> createState() => _SliverAppBarState();
}

class _SliverAppBarState extends State<_SliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      expandedHeight: 200,
      stretch: true,
      pinned: false,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("Hello again , Sliver App Bar"),
        background:
            Image(image: AssetImage("assets/images/apartment_get_started.png")),
        stretchModes: [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
        centerTitle: false,
      ),
    );
  }
}

class _CustomSliverList extends StatelessWidget {
  const _CustomSliverList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            title: Text("Item ${1 + index}"),
          );
        },
        childCount: 20,
      ),
    );
  }
}
