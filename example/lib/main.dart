import 'package:flutter/material.dart';
import 'package:platform_view_bug_demo/foo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _x, _y;

  @override
  void initState() {
    super.initState();

    setState(() {
      _x = 100;
      _y = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Platform View bug demo')),
        body: Column(
          children: <Widget>[
            Text(
              'Start pan gesture on red background and drag until blue box leaves the screen. '
              'Panning gesture will be interrupted when blue box touches the edge of the Platform View.',
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onPanUpdate: (DragUpdateDetails details) {
                      print('onPanUpdate');
                      setState(() {
                        _x = _x + details.delta.dx;
                        _y = _y + details.delta.dy;
                      });
                    },
                    onPanCancel: () => print('onPanCancel'),
                    onPanDown: (DragDownDetails details) => print('onPanDown'),
                    onPanStart: (details) => print('onPanStart'),
                    onPanEnd: (details) => print('onPanEnd'),
                    child: Foo(),
                  ),
                  Positioned(
                    left: _x,
                    top: _y,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Container(
                        color: Colors.blue,
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
