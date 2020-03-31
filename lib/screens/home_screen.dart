import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher_assistant/functions/color_scheme.dart';
import 'package:teacher_assistant/functions/switch_days.dart';
import 'package:teacher_assistant/functions/time_machine.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.superAnimationController}) : super(key: key);

  AnimationController superAnimationController;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<String> categories = ['Today', 'Tomorrow'] + previewDates;
  // Future<Schedule> futureSchedule;
  List<Future<Schedule>> futureSchedules;

  @override
  void initState() {
    super.initState();
    futureSchedules = new List();
    for (var i = 0; i < dates.length; i++) {
      futureSchedules.add(fetchSchedule(dates[i].weekday));
    }
  }

  @override
  void setState(void Function() fn) {
    super.setState(fn);
    Future<Schedule> newerFutureSchedule =
        fetchSchedule(dates[dateSwitcher.currentIndex].weekday);
    newerFutureSchedule.then((schedule) {
      futureSchedules[selectedIndex].then((schedule) {
        var olderSchedule = schedule.schedule;
        if (!listEquals(olderSchedule, schedule.schedule)) {
          futureSchedules[selectedIndex] = newerFutureSchedule;
        }
      });
    });
  }

  void toggle() {
    widget.superAnimationController.isDismissed
        ? widget.superAnimationController.forward()
        : widget.superAnimationController.reverse();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.superAnimationController.isDismissed
            ? {}
            : widget.superAnimationController.reverse();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 30.0,
            // color: Colors.black,
            onPressed: () {
              toggle();
            },
          ),
          title: Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3,
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              // color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 90.0,
              color: Theme.of(context).primaryColor,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        dateSwitcher.switchTo(index);
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 30,
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: index == selectedIndex
                              ? Colors.white
                              : Colors.white60,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    // color: bgScheme.accents[selectedIndex],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    DateFormat('MMMd')
                                        .format(dates[selectedIndex]),
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      letterSpacing: 1.3,
                                      color: Color(0xff34314c),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      DateFormat('E')
                                          .format(dates[selectedIndex]),
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        letterSpacing: 1.3,
                                        color: Color(0xff34314c),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: FutureBuilder<Schedule>(
                          future: futureSchedules[selectedIndex],
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.message == 'Success' &&
                                  snapshot.data.code == '66666') {
                                var schedule = snapshot.data.schedule;
                                return Container(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data.schedule.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String name = schedule[index][0];
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                          vertical: 10.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 35.0,
                                              // backgroundColor: bgcolor,
                                              backgroundColor: Colors.blue,
                                              foregroundColor: Colors.white,
                                              child: Text(
                                                name,
                                                style: TextStyle(
                                                  fontSize: 30.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 0.0,
                                              ),
                                              child: Text(
                                                index < schedule_time.length
                                                    ? schedule_time[index]
                                                    : 'Unknown',
                                                style: TextStyle(
                                                  fontSize: 25.0,
                                                  letterSpacing: 1.0,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text("An API Error Occured: " +
                                      snapshot.data.message),
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text("A Network Error Occured"),
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Schedule {
  final String message;
  final String code;
  final List<String> schedule;
  final int weekday;
  final String modDate;

  Schedule(
      {this.message, this.code, this.weekday, this.schedule, this.modDate});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      message: json['message'],
      code: json['Code'],
      weekday: json['data']['weekday'],
      schedule: List.from(json['data']['schedule']),
      modDate: json['data']['mod_date'],
    );
  }
}

Future<Schedule> fetchSchedule(int weekday) async {
  final response = await http.get(
      'https://www.room923.cf/app/api/getSchedule/?weekday=' +
          weekday.toString());

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Schedule.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load schedule');
  }
}
