import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/nums.dart';

import 'package:ween_blaqe/controller/get_controllers.dart';
// import 'package:ween_blaqe/core/widgets/skeletons/owner_widgets/skeletons_ready/circle_of_steps_skeleton_ready.dart';

import '../../../sesstion/new_session.dart';

class ChangeUserImage extends StatefulWidget {
  const ChangeUserImage({super.key});

  @override
  State<ChangeUserImage> createState() => _ChangeUserImageState();
}

class _ChangeUserImageState extends State<ChangeUserImage> {
  // dynamic _pickImageError;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  XFile? _profileImageFile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        imagesModelController.loadProfileImage();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      appBar: AppBar(
        backgroundColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        title: const Text(
          "تغيير الصورة الشخصية",
          style: TextStyle(fontFamily: "IBM"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: IconButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    if (_profileImageFile?.path != null) {
                      imagesModelController
                          .compressAndUploadProfileImage(_profileImageFile!);
                      setState(() {});
                    }
                    Navigator.pop(context);
                  });
                },
                icon: const Icon(Icons.check)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SafeArea(
                        child: Container(
                          color: themeMode.isLight
                              ? kContainerColorLightMode
                              : kContainerColorDarkMode,
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.photo_library,
                                  color: themeMode.isLight
                                      ? kPrimaryColorLightMode
                                      : kPrimaryColorDarkMode,
                                ),
                                title: Text('من المعرض',
                                    style: TextStyle(
                                        color: themeMode.isLight
                                            ? kTextColorLightMode
                                            : kTextColorDarkMode,fontFamily: "IBM")),
                                onTap: () {
                                  Navigator.pop(context); // Close bottom sheet
                                  _pickProfileImage(ImageSource.gallery);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.camera_alt,
                                    color: themeMode.isLight
                                        ? kPrimaryColorLightMode
                                        : kPrimaryColorDarkMode),
                                title: Text(
                                  'من الكاميرا',
                                  style: TextStyle(
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode,fontFamily: "IBM"),
                                ),
                                onTap: () {
                                  Navigator.pop(context); // Close bottom sheet
                                  _pickProfileImage(ImageSource.camera);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: _profileImageFile?.path == null &&
                        NewSession.get("profile", "def") ==
                            "images/profile/user.png"
                    ? CircleAvatar(
                        radius: 40 * 4,
                        //put a normal person Icon
                        backgroundColor: Colors.grey.shade700,
                        child: const Icon(
                          Icons.person,
                          size: 40 * 3,
                          color: Colors.white,
                        ),
                      )
                    : (_profileImageFile?.path != null
                        ?

                CircleAvatar(
                    radius: 40 * 4,
                    // backgroundImage: NetworkImage(NewSession.get("profile","def")),
                    // Adjust the radius as needed
                    backgroundColor: Colors.grey.shade700,
                    // Set the background color of the avatar
                    backgroundImage: FileImage(File(_profileImageFile?.path ?? ""))
                )
                        : CircleAvatar(
                            radius: 40 * 4,
                            // backgroundImage: NetworkImage(NewSession.get("profile","def")),
                            // Adjust the radius as needed
                            // Set the background color of the avatar
                            backgroundColor: Colors.grey.shade700,
                            backgroundImage: NetworkImage("https://weenbalaqee"
                                ".com/${NewSession.get("profile", "def")}"),
                            // child: SkeletonAvatar(
                            //     style: SkeletonAvatarStyle(
                            //         width: 65 * 5,
                            //         height: 65 * 5,
                            //         borderRadius: BorderRadius.circular(65 * 5))),
                          ))),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _pickProfileImage(ImageSource source) async {
    _profileImageFile = await _picker.pickImage(source: source);
    setState(() {});
  }
}
