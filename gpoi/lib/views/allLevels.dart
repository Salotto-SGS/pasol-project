import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpoi/classes/Level.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gpoi/views/level.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllLevelsPage extends StatefulWidget {
  @override
  _AllLevelsPageState createState() => _AllLevelsPageState();
}

class _AllLevelsPageState extends State<AllLevelsPage> {
  // List<int> levels = [1, 2, 3, 4, 5, 6, 7, 8];
  List<Level> levels = [];
  int _lastLevelNumber;
  double height, width;

  @override
  void initState() {
    getJson();
    getLastLevel();
    super.initState();
  }

  void getLastLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this._lastLevelNumber = prefs.getInt("lastLevelNumber") ?? 1;
  }

  void getJson() async {
    var jsonFile =
        json.decode(await rootBundle.loadString('assets/JsonPazle.json'));
    for (var i = 0; i < jsonFile.length; i++)
      levels.add(Level.fromJson(jsonFile[i]));
    setState(() {});
  }

  Image getImage(id, difficult) {
    if (id < _lastLevelNumber) {
      return new Image.asset("assets/images/divano_blu.png");
    } else if (id == _lastLevelNumber) {
      if (difficult == 0) {
        return new Image.asset("assets/images/divano_verde.png");
      }
      if (difficult == 1) {
        return new Image.asset("assets/images/divano_giallo.png");
      }
      if (difficult == 2) {
        return new Image.asset("assets/images/divano_rosso.png");
      }
    } else if (id > _lastLevelNumber) {
      return new Image.asset("assets/images/divano_grigio.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 780,
              child: ListView.builder(
                itemCount: (levels.length / 4).ceil(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        levels.length > index * 4
                            ? GestureDetector(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      child: getImage(levels[index * 4].id,
                                          levels[index * 4].difficult),
                                    ),
                                    Text(
                                      levels[index * 4].id.toString(),
                                      style: TextStyle(
                                        fontFamily: 'IndieFlower',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  if (levels[index * 4].id <=
                                      _lastLevelNumber) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LevelPage(levels[index * 4].id),
                                      ),
                                    );
                                  }
                                },
                              )
                            : Container(
                                height: height * 0.08,
                                width: width * 0.15,
                              ),
                        levels.length > index * 4 + 1
                            ? GestureDetector(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      child: getImage(levels[index * 4 + 1].id,
                                          levels[index * 4 + 1].difficult),
                                    ),
                                    Text(
                                      levels[index * 4 + 1].id.toString(),
                                      style: TextStyle(
                                        fontFamily: 'IndieFlower',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  if (levels[index * 4 + 1].id <=
                                      _lastLevelNumber) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LevelPage(levels[index * 4 + 1].id),
                                      ),
                                    );
                                  }
                                },
                              )
                            : Container(
                                height: height * 0.08,
                                width: width * 0.15,
                              ),
                        levels.length > index * 4 + 2
                            ? GestureDetector(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      child: getImage(levels[index * 4 + 2].id,
                                          levels[index * 4 + 2].difficult),
                                    ),
                                    Text(
                                      levels[index * 4 + 2].id.toString(),
                                      style: TextStyle(
                                        fontFamily: 'IndieFlower',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  if (levels[index * 4 + 2].id <=
                                      _lastLevelNumber) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LevelPage(levels[index * 4 + 2].id),
                                      ),
                                    );
                                  }
                                },
                              )
                            : Container(
                                height: height * 0.08,
                                width: width * 0.15,
                              ),
                        levels.length > index * 4 + 3
                            ? GestureDetector(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      child: getImage(levels[index * 4 + 3].id,
                                          levels[index * 4 + 3].difficult),
                                    ),
                                    Text(
                                      levels[index * 4 + 3].id.toString(),
                                      style: TextStyle(
                                        fontFamily: 'IndieFlower',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  if (levels[index * 4 + 3].id <=
                                      _lastLevelNumber) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LevelPage(levels[index * 4 + 3].id),
                                      ),
                                    );
                                  }
                                },
                              )
                            : Container(
                                height: height * 0.08,
                                width: width * 0.15,
                              ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
