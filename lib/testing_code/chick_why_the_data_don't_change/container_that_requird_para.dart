import 'package:flutter/material.dart';

class HereShouldDataToPass extends StatefulWidget {
    HereShouldDataToPass(
      {super.key,
        required this.list,
        required this.currentValue,
        this.onSelected,
        this.items});

  final void Function(dynamic)? onSelected;
  String currentValue;
  List<String?>? list;
  final Future<List<String?>?>? items;


  @override
  State<HereShouldDataToPass> createState() => _HereShouldDataToPassState();
}

class _HereShouldDataToPassState extends State<HereShouldDataToPass> {
  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder<List<String?>?>(
        future: widget.items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("جاري التحميل..",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'IBM'));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
              widget.list = snapshot.data;

            widget.currentValue = (widget.list!.isNotEmpty ? widget.list?.first! : "")!;
            return DropdownButtonFormField<dynamic>(
              // onSaved: (c){
              //   for (var i = 0; i < widget.list!.length; ++i) {
              //     if (widget.currentValue == widget.list![i]) {
              //       setState(() {
              //         getDataTest.index = i + 1;
              //       });
              //     }
              //   }
              //   print(getDataTest.index);
              //   print(c);
              // },
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.orange,
                        width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.orange,
                        width: 1),
                  ),
                ),
                value: widget.currentValue,
                items: widget.list
                    ?.map(
                      (c) =>
                      DropdownMenuItem(
                        value: c,
                        child: Text(
                          c!,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.amber,
                              fontFamily: 'IBM'),
                        ),
                      ),
                )
                    .toList(),
                onChanged: widget.onSelected            );
          }
        },
      );
  }
}
