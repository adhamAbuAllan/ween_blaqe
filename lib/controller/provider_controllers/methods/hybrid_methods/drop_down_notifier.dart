import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier to manage the selected dropdown item
class DropdownNotifier extends StateNotifier<int?> {
  DropdownNotifier() : super(null);

  void selectItem(int? itemId) {
    state = itemId;
  }
}

