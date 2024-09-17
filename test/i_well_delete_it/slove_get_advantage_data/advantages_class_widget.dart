import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/advantages.dart';


// main() {
//   runApp(const MaterialApp(
//     home: GetAdvantages(),
//   ));
// }


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
