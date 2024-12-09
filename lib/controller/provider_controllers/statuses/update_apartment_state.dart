class UpdateApartmentState {
  bool isEdit = false;
  bool isDelete = false;


  UpdateApartmentState({this.isEdit = false, this.isDelete = false});

  UpdateApartmentState copyWith({bool? isEdit, bool? isDelete}) {
    return UpdateApartmentState(
      isEdit: isEdit ?? this.isEdit,
      isDelete: isDelete ?? this.isDelete,
    );
  }


}


