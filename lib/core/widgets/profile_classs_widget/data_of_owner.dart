import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';



class DataOfOnwer extends StatefulWidget {
  final String title;
  final int? number;
  const DataOfOnwer({super.key, required this.title, this.number});

  @override
  State<DataOfOnwer> createState() => _DataOfOnwerState();
}

class _DataOfOnwerState extends State<DataOfOnwer> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var number = widget.number;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //about user
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              //about user text
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18, fontFamily: 'IBM', color: Colors.black87),
              ),
              const Expanded(child: SizedBox()),
              //add TextButton
            ],
          ),
          //input something about your self text
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text("${number ?? 0}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                      fontFamily: 'IBM',
                    )),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          aline,
        ],
      ),
    );
  }
}
