
/// create a status of no interent.
//tabnine should be work now !
class NoInternetState {
  final bool isWantToSepha;
  final bool isContExpanding;
  int sebhaTotal;

  NoInternetState({
    this.isWantToSepha = false,
    this.isContExpanding = false,
    this.sebhaTotal = 0
  });

  NoInternetState copyWith({
    bool? isWantToSepha,
    bool? isContExpanding,
    int? sebhaTotal
  }) {
    return NoInternetState(
      isWantToSepha: isWantToSepha ?? this.isWantToSepha,
      isContExpanding: isContExpanding ?? this.isContExpanding,
        sebhaTotal: sebhaTotal ?? this.sebhaTotal
    );
  }
}
