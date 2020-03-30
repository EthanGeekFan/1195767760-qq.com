import 'package:flutter/material.dart';

class Subject {
  final String name;
  final String short;
  Color color;

  Subject({this.name, this.short, this.color});
}

final Subject math = Subject(name: '数学', short: '数', color: Color(0xffff7473));
final Subject chinese =
    Subject(name: '语文', short: '语', color: Color(0xffffc952));
final Subject english =
    Subject(name: '英语', short: '英', color: Color(0xff47b8e0));
final Subject physics =
    Subject(name: '物理', short: '物', color: Color(0xff34314c));
final Subject chemistry =
    Subject(name: '化学', short: '化', color: Color(0xfff349eb));
final Subject biology =
    Subject(name: '生物', short: '生', color: Color(0xff7200da));
final Subject politics =
    Subject(name: '政治', short: '政', color: Color(0xff011627));
final Subject history =
    Subject(name: '历史', short: '史', color: Color(0xffF16B6F));
final Subject geography =
    Subject(name: '地理', short: '地', color: Color(0xff6a60a9));
final Subject tong = Subject(name: '通用', short: '通', color: Color(0xffe97f02));
final Subject psychology =
    Subject(name: '心理', short: '心', color: Color(0xffE71D36));
final Subject pe = Subject(name: '体育', short: '体', color: Color(0xffC16200));
final Subject shengya =
    Subject(name: '生涯', short: '涯', color: Color(0xff60c5ba));
final Subject art = Subject(name: '美术', short: '美', color: Color(0xff99f19e));
final Subject tihuo = Subject(name: '体活', short: '活', color: Color(0xff404146));
final Subject music = Subject(name: '音乐', short: '音', color: Color(0xff00b9f1));
final Subject cleaning =
    Subject(name: '大扫除', short: '扫', color: Color(0xff87314e));
