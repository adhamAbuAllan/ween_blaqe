import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/apartment_provider.dart';
import '../../providers/image_provider.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/update_apartment_ui_widgets/appbar_widgets/appbar_update_apartment_widget.dart';
class ApartmentDataChangedCheckerNotifier extends StateNotifier<bool> {
  ApartmentDataChangedCheckerNotifier() : super(false);
/// a [hasAnyChange] method take a three boolean values and check if any of 
/// them has a true value that if true, that will owner take a massage in the 
/// UI that the data of apartment has been change, 
/// in [AppbarUpdateApartmentWidget].
  bool hasAnyChange(WidgetRef ref) {
    /// the advantagesApiNotifier is the advantages of apartment before 
    /// update it, and the chosenAdvantages is the new advantages that owner 
    /// has been chosen, that you should to now, in every time when user want
    /// to update the apartment, when init the UI in the first time, that the 
    /// chosenAdvantages = advantagesApiNotifier, until owner add or remove an
    /// any advantage.
    /// that a [listEquals] method check if old advantages of apartment is
    ///  changed or not that if changed that [listEquals] will return true 
    /// else will return false.
    var advantagesApiNotifier = ref.read(advantagesApi.notifier).state;
    var chosenAdvantages = ref.read(advantagesNotifier).chosen;
    return ref.read(hasChanged.notifier).state ||
        ref.read(isApartmentImagesUpdated) ||
        !listEquals(advantagesApiNotifier, chosenAdvantages);
  }
}
