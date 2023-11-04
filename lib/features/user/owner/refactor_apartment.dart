import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import '../../../core/widgets/apartments/create_apartment/container_classes_widget/check_boxs/advatnages_check_box/add_advantages_container_class_widget.dart';
import '../../../core/widgets/apartments/create_apartment/container_classes_widget/check_boxs/connection_check_box/add_a_contact_class_widget.dart';
import '../../../core/widgets/apartments/create_apartment/container_classes_widget/containers_choose_items_class_widget/cities_container_choose_item/cities_container_choose_item_class_widget.dart';
import '../../../core/widgets/apartments/create_apartment/container_classes_widget/containers_choose_items_class_widget/type_of_apartment_container_choose_item/container_choose_item_class_widget.dart';
import '../../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
import 'package:ween_blaqe/constants/nums.dart';import 'apartment_of_owner.dart';


class RefactorApartment extends StatefulWidget {
  const RefactorApartment({Key? key}) : super(key: key);

  @override
  State<RefactorApartment> createState() => _RefactorApartmentState();
}

class _RefactorApartmentState extends State<RefactorApartment> {
  String cityBoxTitle = "المدينة";
  int cityId = 0;
  @override
  Widget build(BuildContext context) {
    //Cities box
    // String firstCity = 'الخليل';

    // List<String> cities = [
    //   'الخليل',
    //   'نابلس',
    //   'بيرزيت',
    //   ' القدس',
    //   'رام الله',
    //   'طولكرم',
    //   ' جنين',
    //   'أريحا',
    //   'بيت لحم',
    //   'سلفيت',
    // ];

    //choose address box
    String chooseAddressTitle = "حدد العنوان";
    String hintAddress = "مثال:الخليل-وادالهرية-بجانب مسجد ابوعيشة";
    TextInputType text = TextInputType.text;

//choose rooms box
    String chooseCountRoomsText = "حدد عدد الغرف ";
    String hintCountRooms = "0";
    TextInputType number = TextInputType.number;

    //choose bathrooms box
    String chooseCountBathroomsText = "حدد عدد الحمامات";
    String hintCountBathrooms = "0";
    var addressFocusnose = FocusNode();
    var countRoomsfocusnode = FocusNode();
    var countBathroomsfocusnode = FocusNode();
    //price box
    var priceText = "حدد السعر";
    var priceHint = "يرجى إدخال الإيجار بشكل شهري";
    var priceFocusNode = FocusNode();
    // var numberInputType

    //count of students box
    var countStudentText = "حدد عدد الطلاب المسموح به";
    var countStudentHint = "0";
    var countStudentFocusNode = FocusNode();

    //square meters of apartment box
    var squareText = "حدد حجم الشقة";
    var squareHint = "يرجى إدخال حجم الشقة بالمتر مربع";
    var squareFocusNode = FocusNode();
    //type of apartment box
    var typeApartmentText = "حدد نوع السكن";
    // var firstValueTypeApartment = "طلاب";
    // var typeOfApartmentFoucsNode = FocusNode();
    // List<String> typeApartmentItems= [
    //   'طلاب',
    //   'طالبات'
    // ];
    // Ad box
    var addSuitableTitleForAdText = "أضف عنوان";
    var addSuitableTitleForAdHnit = "سكن طلاب مفروش";
    var adFocusNode = FocusNode();
    var discrptionFocusedNode = FocusNode();
    //discription box
    var discrptionApartmentText = "صف الشقة";
    var discrptionApartmentHint = " شقة خاصة"
        " بالطلاب و في مكان هادئ و بعيد عن الضوضاء ،"
        " لدينا تسهيلات للطلاب و بسعر مناسب ، ويتوفر"
        " فيها العديد من الخدمات مثل السوبر ماركت "
        "و مطعم للوجبات السريعة كذلك يوجد العديد "
        "من المكتبات التي تخدم الطلاب بجميع التخصصات.";

    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: outlineButton,
                  child: const Text("إلغاء"),
                ),
              ),
              const Expanded(child: Text("")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const ApartmentOfOwner();
                      },
                    ));
                  },
                  style: fullButton,
                  child: const Text("حفظ"),
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  //city box
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ContainerChooseCityItemClassWidget(
                      title: cityBoxTitle,
                      onSelected: (c) {
                        cityId = c.id;
                      },
                    ),
                  ),
                  //location box
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextClassWidget(
                        title: chooseAddressTitle,
                        hintInput: hintAddress,
                        inputType: text,
                        focusNode: addressFocusnose,
                        onFieldSubmitted: (value) {}),
                  ),
                  //rooms box
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextClassWidget(
                        title: chooseCountRoomsText,
                        hintInput: hintCountRooms,
                        inputType: number,
                        focusNode: countRoomsfocusnode,
                        onFieldSubmitted: (value) {}),
                  ),
                  //bathrooms box
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ContainerInputTextClassWidget(
                        title: chooseCountBathroomsText,
                        hintInput: hintCountBathrooms,
                        inputType: number,
                        focusNode: countBathroomsfocusnode,
                        onFieldSubmitted: (value) {}),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                    width: 373,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: kContainerColor,
                    ),
                    child: Column(
                      children: [
                        //this row for text
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                              child: Text(
                                "حدد المزايا",
                                style: TextStyle(
                                    fontFamily: 'IBM',
                                    fontSize: 20,
                                    color: Colors.grey.shade800),
                              ),
                            ),
                            const Expanded(child: Text("")),
                          ],
                        ),
                        //here could owner add advantages
                        const AddAdvantages(),
                      ],
                    ),
                  ),
                  //price padding
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextClassWidget(
                      title: priceText,
                      hintInput: priceHint,
                      inputType: TextInputType.number,
                      focusNode: priceFocusNode,
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                  //countStudent padding
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextClassWidget(
                        title: countStudentText,
                        hintInput: countStudentHint,
                        inputType: TextInputType.number,
                        focusNode: countStudentFocusNode,
                        onFieldSubmitted: (value) {}),
                  ),
                  //square padding
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextClassWidget(
                        title: squareText,
                        hintInput: squareHint,
                        inputType: TextInputType.number,
                        focusNode: squareFocusNode,
                        onFieldSubmitted: (value) {}),
                  ),
                  //type of apartment container
                  ContainerChooseTypeApartmentItemClassWidget(
                    title: typeApartmentText,
                  ),
                  //add title to Ad
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextClassWidget(
                        title: addSuitableTitleForAdText,
                        hintInput: addSuitableTitleForAdHnit,
                        inputType: TextInputType.text,
                        focusNode: adFocusNode,
                        onFieldSubmitted: (value) {}),
                  ),
                  // discriptopin the apartment
                  ContainerInputTextClassWidget(
                      title: discrptionApartmentText,
                      maxLines: 7,
                      maxLength: 255,
                      hintMaxLines: 7,
                      hintInput: discrptionApartmentHint,
                      inputType: TextInputType.text,
                      focusNode: discrptionFocusedNode),
                  const AddAcontact()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
