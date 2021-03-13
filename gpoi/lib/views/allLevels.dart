import 'package:flutter/material.dart';

class AllLevelsPage extends StatefulWidget {
  @override
  _AllLevelsPageState createState() => _AllLevelsPageState();
}

class _AllLevelsPageState extends State<AllLevelsPage> {
  List<int> levels = [1, 2, 3, 4, 5, 6, 7, 8];
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
                itemCount: (levels.length / 4).round(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
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
                                levels[index * 4].toString(),
                                style: TextStyle(
                                  fontFamily: 'IndieFlower',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          onTap: () =>
                              Navigator.of(context).pushNamed('/Level'),
                        ),
                        GestureDetector(
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
                                levels[index * 4 + 1].toString(),
                                style: TextStyle(
                                  fontFamily: 'IndieFlower',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          onTap: () =>
                              Navigator.of(context).pushNamed('/Level'),
                        ),
                        GestureDetector(
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
                                levels[index * 4 + 2].toString(),
                                style: TextStyle(
                                  fontFamily: 'IndieFlower',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          onTap: () =>
                              Navigator.of(context).pushNamed('/Level'),
                        ),
                        GestureDetector(
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
                                levels[index * 4 + 3].toString(),
                                style: TextStyle(
                                  fontFamily: 'IndieFlower',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          onTap: () =>
                              Navigator.of(context).pushNamed('/Level'),
                        )
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
