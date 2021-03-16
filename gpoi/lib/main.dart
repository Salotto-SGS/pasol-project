import 'package:flutter/material.dart';
import 'package:gpoi/route/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasol',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pasol Home Page'),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontFamily: 'NotoSerif',
                  ),
                ),
                Container(
                  height: 60,
                  width: 50,
                  child: new Image.asset("assets/images/divano.png"),
                ),
                Text(
                  "AGZLE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontFamily: 'NotoSerif',
                  ),
                ),
              ],
            ),
            Container(
              height: 400,
              width: 400,
              child: new Image.asset("assets/images/divano_nomi.png"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple[400],
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                shadowColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () => {Navigator.of(context).pushNamed('/AllLevels')},
              child: Text(
                "PLAY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'NotoSerif',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
