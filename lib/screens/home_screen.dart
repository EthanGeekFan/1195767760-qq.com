import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher_assistant/functions/color_scheme.dart';
import 'package:teacher_assistant/functions/switch_days.dart';
import 'package:teacher_assistant/functions/time_machine.dart';
import 'package:teacher_assistant/models/class.dart';
import 'package:teacher_assistant/models/subjects.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<String> categories = ['Today', 'Tomorrow'] + previewDates;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          // color: Colors.black,
          onPressed: () {},
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
            onPressed: () {},
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
                    color: bgScheme.accents[selectedIndex],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
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
                      child: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: gaoer16
                              .schedule[
                                  dates[dateSwitcher.currentIndex].weekday - 1]
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            Subject subject = gaoer16.schedule[
                                dates[dateSwitcher.currentIndex].weekday - 1][index];
                            String name = subject.short;
                            Color bgcolor = subject.color;
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
                                    backgroundColor: bgcolor,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
