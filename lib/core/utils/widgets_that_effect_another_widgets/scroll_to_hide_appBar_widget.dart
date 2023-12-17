// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class ScrollToHideAppBarWidget extends StatefulWidget {
//   const ScrollToHideAppBarWidget({Key? key}) : super(key: key);
//
//   @override
//   State<ScrollToHideAppBarWidget> createState() =>
//       _ScrollToHideAppBarWidgetState();
// }
//
// class _ScrollToHideAppBarWidgetState extends State<ScrollToHideAppBarWidget> {
//   final _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     super.dispose();
//   }
//
//   void _onScroll() {
//     if (_scrollController.position.userScrollDirection ==
//         ScrollDirection.reverse) {
//       setState(() {});
//     } else if (_scrollController.position.userScrollDirection ==
//         ScrollDirection.forward) {
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AppBar"),
//       ),
//       body: const Text(""),
//     );
//   }
// }
