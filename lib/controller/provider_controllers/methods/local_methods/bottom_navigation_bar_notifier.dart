import 'package:flutter_riverpod/flutter_riverpod.dart';
class BtmNavBarIndexNotifier extends StateNotifier<int> {
  BtmNavBarIndexNotifier() : super(0);

  void changeTo(int index) {
    state = index;
  }
}
