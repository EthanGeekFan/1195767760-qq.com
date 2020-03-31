import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<Album> futureAlbum;
  TextEditingController _controller = new TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   futureAlbum = fetchAlbum();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      // color: bgScheme.accents[selectedIndex],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x22000000),
                          offset: Offset(0, 0),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                            right: 60,
                          ),
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'Search Here...',
                              border: InputBorder.none,
                              // labelText: "Hello",
                            ),
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              print('Searching...');
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                // color: bgScheme.accents[selectedIndex],
                                color: Color(0xff809CFA),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x66809CFA),
                                    offset: Offset(-4, 0),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Album {
  final String message;
  final String code;
  final List<String> data;

  Album({this.message, this.code, this.data});

  factory Album.fromJson(Map<String, dynamic> json) {
    print(json['data']['schedule']);
    return Album(
      message: json['message'],
      code: json['Code'],
      data: List.from(json['data']['schedule']),
    );
  }
}

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://www.room923.cf/app/api/getSchedule/?weekday=7');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
