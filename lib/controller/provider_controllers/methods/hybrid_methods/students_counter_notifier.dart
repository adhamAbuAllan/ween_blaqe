import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:flutter_riverpod/legacy.dart';

class StudentsCounterNotifier extends StateNotifier<bool> {
  StudentsCounterNotifier() : super(false);

  void setFromApartment(DataOfOneApartment? apartment) {
    if (apartment == null) {
      state = false;
      return;
    }

    final count = apartment.studentCountHave;
    state = (count != null && count != 0);
  }

  /// Convenience read-only check without mutating state.
  bool hasStudents(DataOfOneApartment? apartment) {
    if (apartment == null) return false;
    final val = apartment.studentCountHave;
    return (val != null && val != 0);
  }
  //return tow values Type , a String , and a number of remaining students
  Map<String, int>  aTextAccordingToCountAndType(DataOfOneApartment? apartment) {
    // id type 2 = طلاب
    // id type 3 = طالبات
    String typeText = "";
    if (apartment == null) return {"": 0};
    final totalStudentCount = apartment.countOfStudnet;
    final currentStudentCount = apartment.studentCountHave;
    final remaindingStduent =
        (totalStudentCount != null && currentStudentCount != null)
            ? (totalStudentCount - currentStudentCount)
            : 0;


    if (totalStudentCount == null || totalStudentCount == 0) {
      return {"": 0};
    }
    if (remaindingStduent > 1 && apartment.type?.id == 2) {
      typeText = "طلاب";
    } else if (remaindingStduent == 1 && apartment.type?.id == 2) {
      typeText = "طالب";
    } else if (remaindingStduent > 1 && apartment.type?.id == 3) {
      typeText = "طالبات";
    } else if (remaindingStduent == 1 && apartment.type?.id == 3) {
      typeText = "طالبة";
    }
    return {typeText: remaindingStduent};
  }
}
