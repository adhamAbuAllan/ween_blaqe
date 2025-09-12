class PermissionState {
  final bool cameraGranted;
  final bool photosGranted;

  PermissionState({
    this.cameraGranted = false,
    this.photosGranted = false,
  });

  PermissionState copyWith({
    bool? cameraGranted,
    bool? photosGranted,
  }) {
    return PermissionState(
      cameraGranted: cameraGranted ?? this.cameraGranted,
      photosGranted: photosGranted ?? this.photosGranted,
    );
  }
}
