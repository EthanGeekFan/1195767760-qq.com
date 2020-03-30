import 'package:teacher_assistant/models/subjects.dart';

class Classroom {
  int members;
  final int grade;
  final int id;
  List<List<Subject>> schedule;

  Classroom({
    this.id,
    this.grade,
    this.members,
    this.schedule,
  });
}

final Classroom gaoer16 = Classroom(
  grade: 2,
  members: 50,
  id: 16,
  schedule: [
    [
      math,
      chinese,
      english,
      physics,
      chemistry,
      chemistry,
      biology,
      politics,
    ],
    [
      math,
      chinese,
      english,
      physics,
      chemistry,
      chemistry,
    ],
    [
      math,
      chinese,
      english,
      physics,
      chemistry,
      chemistry,
      biology,
      politics,
      pe,
      tong,
      psychology,
    ],
    [
      math,
      chinese,
      english,
      physics,
      chemistry,
      chemistry,
      biology,
      politics,
      pe,
      tong,
      psychology,
    ],
    [
      math,
      chinese,
      english,
      physics,
      chemistry,
      chemistry,
      biology,
      politics,
      pe,
      tong,
      psychology,
    ],
    [
      math,
      chinese,
      english,
      physics,
      chemistry,
      chemistry,
      biology,
      politics,
      pe,
      tong,
      psychology,
    ],
    [
      math,
      chinese,
      english,
      physics,
      chemistry,
      chemistry,
      biology,
      politics,
      pe,
      tong,
      psychology,
    ],
  ],
);
