import 'package:kazpost/models/course.dart';
import 'package:kazpost/pages/courses/new_course_page.dart';

class CourseBloc {
  CourseModel courseModel = CourseModel();

  Stream<List> get getCourseList async* {
    yield await courseModel.getCourseList();
  }

  Stream<List> get getCourse async* {
    yield await courseModel.getCourse(cid);
  }
 }
