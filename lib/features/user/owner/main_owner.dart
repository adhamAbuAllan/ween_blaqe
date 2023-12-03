// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
// import '../../../core/widgets/bottom_nav_bar/bottom_nav_of_owner.dart';
// import '../../../data_containers/add_ad_data_container.dart';
// import 'package:ween_blaqe/constants/nums.dart';import 'account_of_owner.dart';
// import 'apartments_of_owner_after_add.dart';
// import 'apartments_of_owner_before_add.dart';
// import 'orders.dart';
// import '../../../controller/owner_controller/owner_controller.dart';
// import '../../../sesstion/new_session.dart';
// import '../../widgets_before_user_reg/account_before_login.dart';
// import 'notification_of_owner.dart';
//
// class MainOwner extends StatefulWidget {
//   const MainOwner({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MainOwner> createState() => _MainOwnerState();
// }
//
// class _MainOwnerState extends State<MainOwner> {
//   var ownerController = OwnerController();
//   int index = 0;
//   OwnerController controller = Get.find();
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var ownerController = controller;
//
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//           backgroundColor: Colors.grey.shade200,
//           body: GetBuilder<OwnerController>(
//             builder: (context) {
//               return IndexedStack(
//                 index: ownerController.index,
//                 children: [
//                   AddAdDataContainer.price == null
//                       ? const ApartmentOfOwnerBeforeAdd()
//                       : const ApartmentsOfOwnerAfterAdd(),
//                   const NotificationOfOwner(),
//                   const Orders(),
//                   NewSession.get("logged", "") == ""
//                       ? const AccountBeforeLoginInOwner()
//                       : const AccountOfOwner(),
//                 ],
//               );
//             },
//           ),
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: kPrimaryColor,
//             onPressed: () {
//               // NewSession.get("logged", "") == ""
//               //     ? toast("يرجى تسجيل الدخول لإنشاء إعلانك")
//               //     :
//               myPushName(context, MyPagesRoutes.step1);
//             },
//             child: const Icon(
//               Icons.add_home_outlined,
//               color: Colors.white,
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBarOfOwner(
//             controller: ownerController,
//           )),
//     );
//   }
// }
