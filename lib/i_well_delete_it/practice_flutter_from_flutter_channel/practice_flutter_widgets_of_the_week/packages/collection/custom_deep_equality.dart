import 'package:flutter/material.dart';
import 'cusotm_list.dart';
import 'package:collection/collection.dart';

class CustomDeepEquality extends StatefulWidget {
  const CustomDeepEquality({super.key});

  @override
  State<CustomDeepEquality> createState() => _CustomDeepEqualityState();
}

class _CustomDeepEqualityState extends State<CustomDeepEquality> {
  bool isEqual = false;
  bool isVisable = false;
  var listA = [
    {2, 3},
    3,
    4
  ];
  var listB = [
    {2, 3},
    3,
    4
  ];
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
                var checkList =
                    const DeepCollectionEquality().equals(listA, listB);
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
