import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/i_well_delete_it/practice_flutter_from_flutter_channel/practice_flutter_widgets_of_the_week/packages/collection/cusotm_list.dart';
class CustomListEquality extends StatefulWidget {
  const CustomListEquality({super.key});

  @override
  State<CustomListEquality> createState() => _CustomListEqualityState();
}

class _CustomListEqualityState extends State<CustomListEquality> {
  bool isEqual = false;
  bool isVisable = false;
  List<int> listA = [2, 3, 3, 4];
  List<int> listB = [2, 3, 1, 4];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customListCollectoin(name: "List A", list: listA),
          const SizedBox(
            height: 10,
          ),
          customListCollectoin(name: "List B", list: listB),
          const SizedBox(
            height: 50,
          ),
          isEqual == false
              ? const Text("check if couple of lists is equal 🟰",
                  style: TextStyle(fontSize: 18, color: Colors.white70))
              : const Text("checked",
                  style: TextStyle(fontSize: 18, color: Colors.white70)),
          const SizedBox(
            height: 10,
          ),
          isVisable == true
              ? isEqual == false
                  ? const Text("couple of lists is not equal❎",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ))
                  : const Text("couple of lists is equal✅",
                      style: TextStyle(fontSize: 18, color: Colors.white70))
              : const SizedBox(),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isVisable = true;
                });
                var checkList = const ListEquality().equals(listA, listB);
                if (checkList == true) {
                  setState(() {
                    isEqual = true;
                  });
                } else {
                  setState(() {
                    isEqual = false;
                  });
                }
              },
              child: const Text("check")),
        ],
      ),
    );
  }
}
