import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/elevated_button_widget.dart';
import 'package:ween_blaqe/view/common_widgets/drop_down_widget.dart';
import 'package:ween_blaqe/view/common_widgets/text_widgets/title_of_screen_widget.dart';

class StudentAddWidget extends ConsumerStatefulWidget {
  const StudentAddWidget({
    super.key,
    this.isOwnerApartment = false,
    this.isStudentType = false,
    required this.typeStudentId,
    //this.isChosenStudentCount = false,
    required this.apartmentId,
    required this.countOfStudents,
    required this.currentStudentCount,
  });
  final bool isOwnerApartment;
  final bool isStudentType;
  final int countOfStudents;
  final int currentStudentCount;
  final int typeStudentId;

  final int apartmentId;
  //bool isChosenStudentCount;

  @override
  ConsumerState<StudentAddWidget> createState() =>
      _StudentAddButtonWidgetState();
}

class _StudentAddButtonWidgetState extends ConsumerState<StudentAddWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(apartmentIdNotifier.notifier).state = widget.apartmentId;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> studentsCount =
        List.generate(widget.countOfStudents, (index) => index + 1);
    studentsCount.insert(0, 0);

    final safeStudentsCount = studentsCount.isNotEmpty ? studentsCount : [0];
    return !widget.isOwnerApartment || !widget.isStudentType
        ? const SizedBox()
        : (widget.countOfStudents == widget.currentStudentCount
            ?
           
            TextButton(
                style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                onPressed: () {
                  buttomSheetAddCountStudentsWidget(context, safeStudentsCount);
                },
                child: Text(
                  " - هل مُتبقي ${widget.typeStudentId == 2 ? "طلاب" : "طالبات"} ؟  ",
                  style: const TextStyle(
                    color: Colors.blueAccent,
                  ),
                ))
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .backgroundAppTheme(ref: ref),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      buttomSheetAddCountStudentsWidget(
                          context, safeStudentsCount);
                    },
                    icon: Icon(
                      Icons.person_add_outlined,
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .primaryTheme(ref: ref),
                    ))));
  }

  void buttomSheetAddCountStudentsWidget(
      BuildContext context, List<int> safeStudentsCount) {
    showModalBottomSheet(
      backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        useSafeArea: true,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          // Form to add student placed inside a SafeArea so the
          // modal appears above system UI (notch/status bar)
          // while still allowing the sheet to extend to the
          // top if needed. Also account for keyboard insets.
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
              top: 16.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TitleWidget(
                    title: 'عدد الطلاب الحاليين',
                  ),
                  const SizedBox(height: 16),

                  DropdownFieldWidget(
                    isIntOnly: true,
                    // alreadyExistingValue: safeStudentsCount
                    //  .first,
                    onChanged: (value) async {
                      // value is an int (number of students currently)

                      ref.read(selectedStudentCount.notifier).state =
                          value ?? 0;
                    },

                    items: safeStudentsCount,
                    // safeStudentsCount.map((e) => e.toString())
                    //     .toList(),
                  ),
                  // const TextFormFieldWidget(
                  //   labelName: 'أدخل عدد الطلاب الحاليين',
                  // ),
                  const SizedBox(height: 16),
                  ElevatedButtonWidget(
                    context: context,
                    onPressed: () async {
                      //  widget.isChosenStudentCount = true;
                      ref.read(isChosenStudentCount.notifier).state = true;
                      debugPrint(
                          "isChosenStudentCount in Student_Add_button_Widget ${ref.read(isChosenStudentCount.notifier).state}");

                      Navigator.pop(context);
                    },
                    child: const Text('تحديث'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
