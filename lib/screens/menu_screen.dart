import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String item = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff263859),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Schedule",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                item == "Dashboard"
                                    ? item = "DashBoard"
                                    : item = "Dashboard";
                              });
                            },
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 0,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.dashboard,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                print('hello');
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 30,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 30,
                                    ),
                                    child: Text(
                                      "Settings",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Container(
                    child: Text(
                      'Room 923',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
