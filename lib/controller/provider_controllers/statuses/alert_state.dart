class AlertState{
  final String? title;
  final String? message;
  final String? textOfOkButton;
  final String? textOfCancelButton;

  final Function ?onClickOkBtn;
  AlertState({
    this.title,
    this.message,
    this.textOfOkButton,
    this.textOfCancelButton,
    this.onClickOkBtn
  });
  AlertState copyWith({
    String? title,
    String? message,
    String? textOfOkButton,
    String? textOfCancelButton,
    Function? onClicked,
  }) {
    return AlertState(
      title: title ?? this.title,
      message: message ?? this.message,
      textOfOkButton: textOfOkButton ?? this.textOfOkButton,
      textOfCancelButton: textOfCancelButton ?? this.textOfCancelButton,
      onClickOkBtn: onClicked ?? onClickOkBtn,
    );
  }
}

