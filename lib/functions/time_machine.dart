import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final List<String> schedule_time = [
  '9:30 - 10:10',
  '10:20 - 11:00',
  '11:10 - 11:50',
  '12:20 - 13:00',
  '13:10 - 14:00',
  '15:30 - 16:10',
  '16:20 - 17:00',
  '17:30 - 18:10',
  '18:20 - 19:00',
];

DateTime now = DateTime.now();
String month = now.month.toString();
String day = now.day.toString();
String date = DateFormat('MMMd').format(now);
String weekday = DateFormat('E').format(now);

List<DateTime> dates = [
  now,
  now.add(Duration(days: 1)),
  now.add(Duration(days: 2)),
  now.add(Duration(days: 3)),
  now.add(Duration(days: 4)),
];

List<String> previewDates = [
  DateFormat('MMMd').format(now.add(Duration(days: 2))),
  DateFormat('MMMd').format(now.add(Duration(days: 3))),
  DateFormat('MMMd').format(now.add(Duration(days: 4))),
];
