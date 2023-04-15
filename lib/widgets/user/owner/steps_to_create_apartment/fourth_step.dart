// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_add_images_class_widget.dart';
import '../../../../classes_that_effect_widgets/apartments/create_apartment/image_picker_apartment.dart';
import '/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/add_a_contact_class_widget.dart';
import '/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import '/widgets/user/owner/apartments_of_owner_after_add.dart';

import '../../../../styles/button.dart';

class FourthStep extends StatefulWidget {
  const FourthStep({Key? key}) : super(key: key);

  @override
  State<FourthStep> createState() => _FourthStepState();
}

class _FourthStepState extends State<FourthStep> {
  @override
  Widget build(BuildContext context) {
    // Ad box
    var addSuitableTitleForAdText = "أضف عنوان";
    var addSuitableTitleForAdHnit = "سكن طلاب مفروش";
    var adFocusNode = FocusNode();
    var discrptionFocusedNode = FocusNode();
    //discription box
    var discrptionApartmentText  = "صف الشقة";
    var discrptionApartmentHint = " شقة خاصة"
        " بالطلاب و في مكان هادئ و بعيد عن الضوضاء ،"
        " لدينا تسهيلات للطلاب و بسعر مناسب ، ويتوفر"
        " فيها العديد من الخدمات مثل السوبر ماركت "
        "و مطعم للوجبات السريعة كذلك يوجد العديد "
        "من المكتبات التي تخدم الطلاب بجميع التخصصات.";

    //images  box
    var titleOfImageContainer = "أضف صور للشقة";
    var images = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'

    ];

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: outlineButton,
                  child: const Text("رجوع"),
                ),
              ),
              const Expanded(child: Text("")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Get.to(ApartmentsOfOwnerAfterAdd());
                  },
                  style: fullButton,
                  child: const Text("حفظ"),
                ),
              ),
            ],
          ),

          body: SingleChildScrollView(
        child: Column(
          children: [

            //text steps
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text("الخطوة الأخيرة",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                  fontFamily: 'IBM',
                ),
              ),
            ),
            //image steps
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 30),
              child: Image.asset('assets/'
                  'images/'
                  'apartments_images/'
                  'images_to_create_apartment/'
                  'step_four.png',
                width: 65,
                height: 65,fit: BoxFit.fill,),
            ),

            //add images
            //   ContainerAddImagesClassWidget(title: titleOfImageContainer,
            //     images: images,
            //   ),

            //add title to Ad
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ContainerInputTextClassWidget(
                  title: addSuitableTitleForAdText,
                  hintInput: addSuitableTitleForAdHnit,
                  inputType: TextInputType.text,focusNode: adFocusNode,
                  onFieldSubmitted: (value){}),
            ),
            // discriptopin the apartment
            ContainerInputLongTextClassWidget(
                title: discrptionApartmentText ,
                hintInput: discrptionApartmentHint,
                inputType: TextInputType.text,focusNode: discrptionFocusedNode),


            const AddAcontact()
          ],
         ),

      ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Get.to(ImagePickerTesting);
              Navigator.of(context).push(
MaterialPageRoute(builder: (context) => AddImages(),));

            },
            label: const Text('أضف صور'),
            icon: const Icon(Icons.photo),
            backgroundColor: Colors.orange,
          ),
    ));
  }
}
