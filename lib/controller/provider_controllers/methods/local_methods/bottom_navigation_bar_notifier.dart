import 'package:flutter_riverpod/legacy.dart';

class BtmNavBarIndexNotifier extends StateNotifier<int> {
  BtmNavBarIndexNotifier() : super(0);

  void changeTo(int index) {
    state = index;
  }
}
