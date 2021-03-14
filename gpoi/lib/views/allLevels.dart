import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpoi/classes/Level.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gpoi/views/level.dart';

class AllLevelsPage extends StatefulWidget {
  @override
  _AllLevelsPageState createState() => _AllLevelsPageState();
}

class _AllLevelsPageState extends State<AllLevelsPage> {
  // List<int> levels = [1, 2, 3, 4, 5, 6, 7, 8];
  List<Level> levels = [];

  @override
  void initState() {
    getJson();
    super.initState();
  }

  void getJson() async {
    var jsonFile =
        json.decode(await rootBundle.loadString('assets/JsonPazle.json'));
    for (var i = 0; i < jsonFile.length; i++)
      levels.add(Level.fromJson(jsonFile[i]));
    setState(() {});
    // print(levels);
  }

  @override
  Widget build(BuildContext context) {
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
                                      height: 35,
                                      width: 65,
                                      child: new Image.asset(
                                          "assets/images/divano_blu.png"),
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
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LevelPage(levels[index * 4].id),
                                  ),
                                ),
                              )
                            : Container(
                                height: 35,
                                width: 65,
                              ),
                        levels.length > index * 4 + 1
                            ? GestureDetector(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 65,
                                      child: new Image.asset(
                                          "assets/images/divano_rosso.png"),
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
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LevelPage(levels[index * 4 + 1].id),
                                  ),
                                ),
                              )
                            : Container(
                                height: 35,
                                width: 65,
                              ),
                        levels.length > index * 4 + 2
                            ? GestureDetector(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 65,
                                      child: new Image.asset(
                                          "assets/images/divano_verde.png"),
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
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LevelPage(levels[index * 4 + 2].id),
                                  ),
                                ),
                              )
                            : Container(
                                height: 35,
                                width: 65,
                              ),
                        levels.length > index * 4 + 3
                            ? GestureDetector(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 65,
                                      child: new Image.asset(
                                          "assets/images/divano_giallo.png"),
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
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LevelPage(levels[index * 4 + 3].id),
                                  ),
                                ),
                              )
                            : Container(
                                height: 35,
                                width: 65,
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
