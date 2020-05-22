import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Foo extends StatefulWidget {
  const Foo({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FooState();
}

class _FooState extends State<Foo> {
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'fooView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'fooView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text('$defaultTargetPlatform is not yet supported by the plugin');
  }

  void _onPlatformViewCreated(int id) {}
}
