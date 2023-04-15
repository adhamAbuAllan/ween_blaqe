import 'package:flutter/material.dart';

class ContainerAddImagesClassWidget extends StatefulWidget {
  String title;

  List images;

  ContainerAddImagesClassWidget({
    Key? key,
    required this.title,
   required this.images,
  }) : super(key: key);

  @override
  State<ContainerAddImagesClassWidget> createState() =>
      _ContainerAddImagesClassWidgetState();
}

class _ContainerAddImagesClassWidgetState
    extends State<ContainerAddImagesClassWidget> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var listImages = widget.images;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
        // width: 373,
        // height: 140,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
        ),


        child: Column(

          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                      fontFamily: 'IBM',
                    ),
                  ),
                ),
                // const Expanded(child: Text("")),
              ],
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7
              ),
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child:Image(image: NetworkImage(listImages[index] ?? "",),
                    fit: BoxFit.cover,
                  )

                );
                },),
            ),
          ],
        ),
      ),
    );
  }
}
