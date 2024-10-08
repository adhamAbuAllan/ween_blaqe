// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/core/widgets/apartments/show_more_classes_widget/show_all_advantages_class_widget.dart';

import '../../../../api/advantages.dart';
import '../../../../api/apartments_api/one_apartment.dart';
import '../../../../constants/nums.dart';
import '../../../utils/styles/button.dart';
class GetAdvantages extends StatefulWidget {
  const GetAdvantages({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  State<GetAdvantages> createState() => _GetAdvantagesState();
}

class _GetAdvantagesState extends State<GetAdvantages> {
  late List<Advantages>? advantages = widget.oneApartment?.advantages;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
      decoration: BoxDecoration(
        color: themeMode.isDark
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text("المزايا",
                    style: TextStyle(
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                      fontSize: 20,
                      fontFamily: 'IBM',
                    )),
              ),
              const Expanded(child: Text("")),
            ],
          ),
          Column(
            children: _advantageItemsWidget(advantages: advantages)
                .toList()
                .take(10)
                .toList(),
          ),

//button to show more advantages
          (advantages?.length ?? 0) > 10
              ? Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ShowAllAdvantages(features: advantages!);
                      }),
                    );
                  },
                  style: fullButton(themeMode: themeMode),
                  child: Text(
                      "عرض الميزات ال${(advantages?.length ?? 0) - 10} الآخرى")),
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }



  Iterable<Padding> _advantageItemsWidget({List<Advantages>? advantages}) {
    return advantages?.map((entry) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: ListTile(
          title: Text(entry.advName!,
              style: TextStyle(
                  fontFamily: 'IBM',
                  fontSize: 16,
                  color: themeMode.isDark
                      ? kTextColorLightMode
                      : kTextColorDarkMode)),
          trailing: entry.icon!.isEmpty
              ? const SizedBox(
              child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(width: 28, height: 28)))
              : Image.network(
            entry.icon!,
            height: 30,
            width: 30,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                  child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: 28,
                        height: 28,
                      )));
            },
            color: themeMode.isDark
                ? kTextColorLightMode
                : kTextColorDarkMode,
          ),
        ),
      );
    }) ??
        [].map((e) => const Padding(
          padding: EdgeInsets.all(0),
          child: SizedBox(),
        ));
  }
}
