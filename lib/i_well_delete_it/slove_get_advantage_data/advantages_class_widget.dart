
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../api/advantages.dart';
import '../../api/apartments_api/one_apartment.dart';
import '../../constants/nums.dart';
import '../../core/utils/styles/button.dart';

main() {
  runApp(const MaterialApp(
    home: GetAdvantages(),
  ));
}

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
        color: kContainerColor,
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
                      color: Colors.black.withOpacity(.7),
                      fontSize: 20,
                      fontFamily: 'IBM',
                    )),
              ),
              const Expanded(child: Text("")),
            ],
          ),
          Column(
            children:
            _advantageItemsWidget(advantages: advantages)
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
                              return ShowAllAdvantages(
                                  features: advantages!);
                            }),
                          );
                        },
                        style: fullButton,
                        child: Text(
                            "عرض الميزات ال${(advantages?.length ??0)-10} الآخرى")),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  // Future<List<Advantages>> featchAdvantages() async {
  //   Uri uri = Uri.parse(ServerLocalDiv.apartmentAll);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     List jsonResponse = jsonDecode(response.body);
  //
  //     return jsonResponse.map((item) => Advantages.fromJson(item)).toList();
  //   } else {
  //     setState(() {});
  //     throw Exception('Failed to load photos from API');
  //   }
  // }

  Iterable<Padding> _advantageItemsWidget({List<Advantages>? advantages}) {
    return advantages?.map((entry) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: ListTile(
              title: Text(entry.advName,
                  style: TextStyle(
                      fontFamily: 'IBM',
                      fontSize: 16,
                      color: Colors.black.withOpacity(.7))),
              trailing: entry.icon.isEmpty ? const SizedBox(child: SkeletonAvatar(
                  style:
                  SkeletonAvatarStyle(width: 28, height: 28))) :Image.network(
                entry.icon,
                height: 30,
                width: 30,
                errorBuilder: (context, error, stackTrace) {
                  return  const SizedBox(child: SkeletonAvatar(

                      style:
                      SkeletonAvatarStyle(width: 28, height: 28,)));
                },
                color: Colors.black.withOpacity(.5),
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
//advantage coinater calss widget
// import 'dart:html';

class AdvantagesClassWidget extends StatefulWidget {
  const AdvantagesClassWidget({Key? key}) : super(key: key);

  @override
  State<AdvantagesClassWidget> createState() => _AdvantagesClassWidgetState();
}

class _AdvantagesClassWidgetState extends State<AdvantagesClassWidget> {
  late List<Advantages> features;
  List<int> chosen = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: advantageItemsWidget().toList(),
    );
  }

  Iterable<Padding> advantageItemsWidget() {
    return features.map((feature) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Row(
          children: [
            Text(
              "feature.advName",
              style: TextStyle(
                  fontFamily: 'IBM', fontSize: 16, color: Colors.grey.shade800),
            ),
            // const Expanded(child: Text("")),
            // Image(
            //   image: AssetImage(feature.icon),
            //   width: 30,
            //   height: 30,
            // )
          ],
        ),
      );
    });
  }
}

class ShowAllAdvantages extends StatefulWidget {
  const ShowAllAdvantages({super.key, required this.features});

  final List<Advantages> features;

  @override
  State<ShowAllAdvantages> createState() => _ShowAllAdvantagesState();
}

class _ShowAllAdvantagesState extends State<ShowAllAdvantages> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent ,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,

        body: Column(

          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: IconButton(
                    padding: const EdgeInsets.only(right: 10),
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                      )),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: kContainerColor,
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text("المزايا",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontFamily: 'IBM',
                            )),
                      ),
                      Expanded(child: Text("")),
                    ],
                  ),

                     SizedBox(
                       height: 530,
                       child: ListView.builder(

                           padding: const EdgeInsets.all(0),
                          itemCount: widget.features.length,
                          itemBuilder: ((c, i) {
                            return ListTile(
                              title: Text(widget.features[i].advName,
                                style: TextStyle(
                                    fontFamily: 'IBM',
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7)),
                              ),

                              trailing: widget.features[i].icon.isEmpty ? const SizedBox(child: CircularProgressIndicator(color: kPrimaryColor,strokeWidth: 3,)) :


                              Image.network(
                                  widget.features[i].icon,
                                  height: 30,
                                  width: 30,
                                  color: Colors.black.withOpacity(.5),
                                )
                            );
                          })),
                     ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

