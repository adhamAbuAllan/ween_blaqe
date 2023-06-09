import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/show_more_classes_widget/generic_info_class_widget.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/urls_of_project/localhost_urls.dart';
import 'package:ween_blaqe/widgets/user/studnet/show_more.dart';

import '../../../../api/apartments.dart';
import '../../../../skeletons/student_widgets/show_more_skeleton_widget.dart';
import '../../../../styles/button.dart';
import '../../../toast_widget.dart';
import 'new_show_more.dart';

void main() {
  runApp(MaterialApp(
    home: NewMasterHome(),
  ));
}

class NewMasterHome extends StatefulWidget {
  const NewMasterHome({Key? key}) : super(key: key);

  @override
  State<NewMasterHome> createState() => _NewMasterHomeState();
}

class _NewMasterHomeState extends State<NewMasterHome> {
  // For holding response as UserPets
  late ApartmentsRes apartmentsRes;

  // for data is loaded flag
  bool isDataLoaded = false;

  // error holding
  String errorMessage = '';

  // API Call
  Future<ApartmentsRes> getDataFromAPI() async {
    Uri uri = Uri.parse(ServerLocalDiv.apartmentAll);
    print("uri --$uri");
    var response = await http.get(uri);
    print("response --$response");
    // if (response.statusCode == 200) {
      // All ok
      ApartmentsRes usersPets = apartmentPetsFromJson(response.body);

      print(usersPets);
      setState(() {
        isDataLoaded = true;
      });
      print(usersPets);

      return usersPets;
    // } else {
      errorMessage = '${response.statusCode}: ${response.body} ';
      return ApartmentsRes(data: []);
    // }
  }

  callAPIandAssignData() async {
    apartmentsRes = await getDataFromAPI();
    print(apartmentsRes);
  }

  @override
  void initState() {
    super.initState();
    // myPushName(context, MyPagesRoutes.skeletonShowMoreWidget);
    // SkeletonShowMoreWidget;

    callAPIandAssignData();

    // print(callAPIandAssignData());
    // print(apartmentsRes.data);
  }

  bool clicked = false;

  @override
  Widget build(BuildContext context) {

    return
        // Scaffold(

        // backgroundColor: Colors.grey.shade200,
        isDataLoaded
            ? errorMessage.isNotEmpty
                ? Text(errorMessage)
                : apartmentsRes.data.isEmpty
                    ? const Text(
                        "لا يوجد إعلانات في الوقت الحالي يرجى المحاولة لاحقًا.")
                    : ListView.builder(
                        // shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        itemCount: apartmentsRes.data.length,
                        itemBuilder: (ctx, index) => apartments(index,false)
        )
            : HomeSkeletonWidget();
  }

  Widget apartments(int index,bool checked,) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
      // width: 373,
      height: 395,
      //decoration of show apartment style
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
        children: [
          // bookmark iconImage
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " سكن :${apartmentsRes.data[index].type ?? ""}",
                  style: const TextStyle(fontSize: 14, fontFamily: 'IBM'),
                ),
              ),
              Expanded(child: Text("")),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: checked == false ? IconButton(
                  onPressed: () {
                    setState(() {
                      clicked = false;
                    });
                  },
                  icon:
                      const Icon(
                          Icons.bookmark_outline,
                          size: 28,
                        )

                ): IconButton(
                    onPressed: () {
                      setState(() {
                        clicked = true;
                      });
                    },
                    icon:
                    const Icon(
                      Icons.bookmark,
                      size: 28,
                    )

                ),
              ),
            ],
          ),
          // image/s of apartment
          ClipRRect(
              borderRadius: BorderRadius.circular(7 / 2),
              child:  const Image(
                image: AssetImage("assets/images/apartments_images/image1.png")
                // child: Image(image: Image.network("src")),
                ,
                height: 240,
                // width:368,
              )),
          // title and price
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(apartmentsRes.data[index].title ?? "",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontFamily: 'IBM',
                      fontSize: 15,
                    )),
              ),
              const Expanded(child: Text("")),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                child: Text(apartmentsRes.data[index].price.toString(),
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
                child: Text("ش/ش",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'IBM',
                    )),
              ),
            ],
          ),

          // see more and location
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => NewShowMore(
                              oneApartment: apartmentsRes.data[index],
                            )));
                    // myPushName(context, MyPagesRoutes.showMore);
                  },
                  style: outlineButton,
                  child: const Text(
                    " عرض المزيد ",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'IBM',
                    ),
                  ),
                ),
              ),
              Expanded(child: Text("")),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text("الموقع:",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(apartmentsRes.data[index].city ?? "",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
