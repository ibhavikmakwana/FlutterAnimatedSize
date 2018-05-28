import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AnimatedSize',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double _height = 80.0;
  double _width = 80.0;
  var _color = Colors.blue;
  bool _resized = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new AnimatedSize(
              curve: Curves.bounceInOut,
              child: new GestureDetector(
                onTap: () {
                  setState(() {
                    if (_resized) {
                      _resized = false;
                      _color = Colors.blue;
                      _height = 80.0;
                      _width = 80.0;
                    } else {
                      _resized = true;
                      _color = Colors.blue;
                      _height = 320.0;
                      _width = 320.0;
                    }
                  });
                },
                child: new Container(
                  width: _width,
                  height: _height,
                  color: _color,
                ),
              ),
              vsync: this,
              duration: new Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }
}
