import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/apartment_provider.dart';
import '../../providers/image_provider.dart';

class ApartmentDataChangedCheckerNotifier extends StateNotifier<bool> {
  ApartmentDataChangedCheckerNotifier() : super(false);

  bool hasAnyChange(WidgetRef ref) {
    var advantagesApiNotifier = ref.read(advantagesApi.notifier).state;
    var chosenAdvantages = ref.read(advantagesNotifer).chosen;
    return ref.read(hasChanged.notifier).state ||
        ref.read(isApartmentImagesUpdated) ||
        !listEquals(advantagesApiNotifier, chosenAdvantages);
  }
}
