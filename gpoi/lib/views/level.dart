import 'dart:convert';

import 'package:flutter/foundation.dart';
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
  Icon _responseIcon = Icon(Icons.fiber_manual_record_outlined);

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
        _responseIcon = Icon(Icons.check_rounded);
        showModal();
        setState(() {});
        return;
      }
    }
    _responseIcon = Icon(Icons.clear_rounded);
    for (var i = 0; i < level.wrongAnswer.length; i++) {
      if (level.wrongAnswer[i].userAnswer.toLowerCase() ==
          text.text.toLowerCase()) {
        _modalTitle = "Risposta errata";
        _modalBody = level.wrongAnswer[i].tip;
        showModal();
        break;
      }
    }
    setState(() {});
  }

  Future<void> showModal() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            title: Text(
              _modalTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'IndieFlower',
              ),
            ),
            content: Text(
              _modalBody,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'AlegreyaSans',
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  "Ho capito!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'IndieFlower',
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple[400],
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                  shadowColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () async {
                  if (_modalTitle == "Risposta corretta") {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setInt("lastLevelNumber", level.id + 1);
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/AllLevels');
                    return;
                  }
                  Navigator.of(context).pop();
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
                      onPressed: () =>
                          Navigator.pushNamed(context, '/AllLevels'),
                    ),
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
                      icon: _responseIcon,
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                            hintText: 'Scrivi qui',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
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
