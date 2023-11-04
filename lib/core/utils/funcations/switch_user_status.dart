/*
/// if status = false => Student Screen, else -true- Owner Screen///
in this case , the switchState Will switch between NewMasterHome class and the
 screen of owner
 the [status] decide what the next screen will be.

 */
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
main()
{
  runApp(const MaterialApp(home:Scaffold(body: SwitcherStatus())));
}




Widget switchState (bool status,BuildContext context){
  if(status == false){
    showSnakBar(context, "Student Screen must visable");
    return  Center(child: Text("Student Screen"),);
  }else{
    showSnakBar(context, "Owner Screen must visable");

    return  Center(child: Text("Owner Screen"));
  }
}






// class MatiralOfSwitch extends StatelessWidget {
//   const MatiralOfSwitch({Key? key}) : super(key: key);
@override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: SwitcherStatus(),
//   );
// }
// }
class SwitcherStatus extends StatefulWidget {
  const SwitcherStatus({super.key});
  @override
  State<SwitcherStatus> createState() => _SwitcherStatusState();
}

class _SwitcherStatusState extends State<SwitcherStatus> {
  bool light0 = true;
  bool light1 = true;
  bool light2 = true;
  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          activeColor: kPrimaryColor,
          thumbIcon: thumbIcon,
          value: light1,
          onChanged: (bool value) {
            setState(() {
              switchState(value,context);
              light1 = value;
              // value ==
              // false
              // ? toast("تم كتم الاشعارات")
              // : toast("تم تفعيل الاشعارات");
            });
          },
        ),
      ],
    );
  }
}
