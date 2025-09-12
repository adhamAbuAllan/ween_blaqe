/// create a status of no interent.
//tabnine should be work now !
class NoInternetState {
  bool isWantToSepha;
  bool isContExpanding;
  bool isAnimated;
  bool isFirstAnimate;
  bool isSecondAnimate;
  bool isSephaCountrEnd;
  bool isLongPress;
  int sebhaTotal;
  int sephaCounter;

  NoInternetState({
    this.isWantToSepha = false,
    this.isContExpanding = false,
    this.isAnimated = false,
    this.isFirstAnimate = false,
    this.isSecondAnimate = false,
    this.isSephaCountrEnd = false,
    this.isLongPress = false,
    this.sebhaTotal = 0,
    this.sephaCounter = 0,
  });

  NoInternetState copyWith(
      {bool? isWantToSepha,
      bool? isContExpanding,
      bool? isAnimated,
      bool? isFirstAnimate,
      bool? isSecondAnimate,
      bool? isSephaCountrEnd,
      bool? isLongPress,
      int? sebhaTotal,
      int? sephaCounter,
      }) {
    return NoInternetState(
        isWantToSepha: isWantToSepha ?? this.isWantToSepha,
        isContExpanding: isContExpanding ?? this.isContExpanding,
        sebhaTotal: sebhaTotal ?? this.sebhaTotal,
        isAnimated: isAnimated ?? this.isAnimated,
        isFirstAnimate: isFirstAnimate ?? this.isFirstAnimate,
        isSecondAnimate: isSecondAnimate ?? this.isSecondAnimate,
        isSephaCountrEnd: isSephaCountrEnd ?? this.isSephaCountrEnd,
        isLongPress: isLongPress ?? this.isLongPress,
    sephaCounter: sephaCounter ?? this.sephaCounter
    );
  }
}
