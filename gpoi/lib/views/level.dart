import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpoi/classes/Level.dart';

class LevelPage extends StatefulWidget {
  int _id;

  LevelPage(this._id);

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  Level level;
  Color backgroundColor = new Color(0xffffffff);
  String title = "";

  @override
  void initState() {
    // print(this.widget._id);
    getJson();
    super.initState();
  }

  Color hexToColor(String hex) {
    return new Color(int.parse(hex, radix: 16) + 0xFF000000);
  }

  void getJson() async {
    var jsonFile =
        json.decode(await rootBundle.loadString('assets/JsonPazle.json'));
    for (var i = 0; i < jsonFile.length; i++) {
      if (Level.fromJson(jsonFile[i]).id == this.widget._id) {
        level = Level.fromJson(jsonFile[i]);
      }
    }
    setState(() {
      backgroundColor = hexToColor(level.backgroundColor);
      title = level.suggestion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back, size: 30),
                        onPressed: null),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'IndieFlower',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: Image.asset('assets/images/banana.png'),
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('assets/images/ellipse.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 5.0,
                              ),
                            ),
                            hintText: 'Scrivi qui',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
