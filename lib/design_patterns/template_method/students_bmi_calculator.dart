import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import 'student.dart';

// skeleton abstract class which the subclasses will override its functions and implement its abstract method
abstract class StudentsBmiCalculator {
  const StudentsBmiCalculator();

  // this method will executed by client class >>>>>>>>>>>>>>
  // return list of students after sum operations
  List<Student> calculateBmiAndReturnStudentList() {
    // get list of student
    var studentList = getStudentsData();
    // pass list of student to do filtering
    studentList = doStudentsFiltering(studentList);
    // calc Bmi to selected students
    _calculateStudentsBmi(studentList);
    return studentList;
  }

  void _calculateStudentsBmi(List<Student> studentList) {
    for (final student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  double _calculateBmi(double height, int weight) {
    return weight / math.pow(height, 2);
  }
  // ---------------------------------------------------------------------------------------------
  // optional to implement this method by subclass
  // Hook methods
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList;
  }

  // subclass will forced to implement this method
  // Abstract methods
  @protected
  List<Student> getStudentsData();
}
