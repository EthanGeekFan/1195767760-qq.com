import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key, this.superAnimationController}) : super(key: key);
  AnimationController superAnimationController;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String item = "Dashboard";

  final double menuPaddingTop = 20;
  final double menuPaddingLeft = 20;
  final double menuTitleFontSize = 40.0;
  final double listPaddingTop = 50;
  final double menuItemIconSize = 24;
  final double menuItemFontSize = 20;
  final double menuItemPaddingTop = 30;
  final double iconTextPadding = 30;

  void navigateTo(String routeName) {
    widget.superAnimationController.isDismissed
        ? {}
        : widget.superAnimationController.reverse();
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff263859),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: menuPaddingLeft,
              top: menuPaddingTop,
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
                        fontSize: menuTitleFontSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: listPaddingTop,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.superAnimationController.isDismissed
                                    ? {}
                                    : widget.superAnimationController.reverse();
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
                                      size: menuItemIconSize,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: iconTextPadding,
                                      ),
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: menuItemFontSize,
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
                                navigateTo('/settings');
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: menuItemPaddingTop,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                    size: menuItemIconSize,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: iconTextPadding,
                                    ),
                                    child: Text(
                                      "Settings",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: menuItemFontSize,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navigateTo('/search');
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: menuItemPaddingTop,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: menuItemIconSize,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: iconTextPadding,
                                    ),
                                    child: Text(
                                      "Profile",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: menuItemFontSize,
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
