
import '../../../api/advantages.dart';
class AdvantageState {
  final List<int> chosen;
  final List<Advantages> advantages;
  final bool isChecked;
  final bool dataStatus;
  final bool isDataLoading;

  AdvantageState({
    this.chosen = const [],
    this.advantages = const [],
    this.isChecked = false,
    this.dataStatus = false,
    this.isDataLoading = false,
  });

  AdvantageState copyWith({
    List<int>? chosen,
    List<Advantages>? advantages,
    bool? isChecked,
    bool? dataStatus,
    bool? isDataLoading,
  }) {
    return AdvantageState(
      chosen: chosen ?? this.chosen,
      advantages: advantages ?? this.advantages,
      isChecked: isChecked ?? this.isChecked,
      dataStatus: dataStatus ?? this.dataStatus,
      isDataLoading: isDataLoading ?? this.isDataLoading,
    );
  }
}
