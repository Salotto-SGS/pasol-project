import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpoi/classes/Level.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Image _levelImage;
  String _modalTitle;
  String _modalBody;
  TextEditingController _responseController = new TextEditingController();

  @override
  void initState() {
    // print(this.widget._id);
    getJson();
    super.initState();
  }

  Color hexToColor(String hex) {
    return new Color(int.parse(hex, radix: 16) + 0xFF000000);
  }

  void getResponse(TextEditingController text) {
    for (var i = 0; i < level.correctAnswer.length; i++) {
      if (text.text.toLowerCase() == level.correctAnswer[i].toLowerCase()) {
        _modalTitle = "Risposta corretta";
        _modalBody = level.congratulations;
        showModal();
      }
    }

    for (var i = 0; i < level.wrongAnswer.length; i++) {
      if (level.wrongAnswer[i].userAnswer.toLowerCase() ==
          text.text.toLowerCase()) {
        _modalTitle = "Risposta errata";
        _modalBody = level.wrongAnswer[i].tip;
        showModal();
        break;
      }
    }
  }

  Future<void> showModal() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_modalTitle),
            content: Text(_modalBody),
            actions: [
              TextButton(
                child: Text("Ho capito!"),
                onPressed: () async {
                  if (_modalTitle == "Risposta corretta") {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setInt("lastLevelNumber", level.id + 1);
                  }
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/AllLevels');
                },
              )
            ],
          );
        });
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
      _levelImage = new Image.asset(level.image);
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
                child: _levelImage,
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
                  Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.fiber_manual_record_outlined),
                      color: Colors.white,
                      onPressed: () => {getResponse(_responseController)},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 250,
                        child: TextField(
                          controller: _responseController,
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
