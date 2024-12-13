import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../statuses/permission_state.dart';

class PermissionNotifier extends StateNotifier<PermissionState> {
  PermissionNotifier() : super(PermissionState());

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      state = state.copyWith(cameraGranted: true);
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> requestPhotosPermission() async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      state = state.copyWith(photosGranted: true);
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

}