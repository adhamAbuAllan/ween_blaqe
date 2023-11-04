import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../api/advantages.dart';
import '../../api/apartments_api/one_apartment.dart';
import '../../constants/nums.dart';
import '../../constants/strings.dart';
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
                              return ShowAllAdvantagesTest(
                                  features: advantages!);
                            }),
                          );
                        },
                        style: fullButton,
                        child: Text(
                            "عرض الميزات ال${advantages?.length ?? 0 - 9} الآخرى")),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Future<List<Advantages>> featchAdvantages() async {
    Uri uri = Uri.parse(ServerLocalDiv.apartmentAll);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((item) => Advantages.fromJson(item)).toList();
    } else {
      setState(() {});
      throw Exception('Failed to load photos from API');
    }
  }

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
              trailing: Image.network(
                entry.icon,
                height: 30,
                width: 30,
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

class ShowAllAdvantagesTest extends StatefulWidget {
  const ShowAllAdvantagesTest({super.key, required this.features});

  final List<Advantages> features;

  @override
  State<ShowAllAdvantagesTest> createState() => _ShowAllAdvantagesTestState();
}

class _ShowAllAdvantagesTestState extends State<ShowAllAdvantagesTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.features.length,
          itemBuilder: ((c, i) {
            return const ListTile(
              title: Text("feature.advName"),
            );
          })),
    );
  }
}
