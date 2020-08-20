import 'package:flutter/material.dart';

class TopPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomePage(
      key: UniqueKey(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_WidgetA(), _WidgetB(), _WidgetC()],
        ),
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  final Widget child;

  _HomePage({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  /**
   * 先祖を辿って_MyInheritedWidgetを検索する
   * _MyInheritedWidgetにはdata変数で_HomePageStateを保持している
   * そのStateを返すように実装している
  */
  static _HomePageState of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
     // ビルドが必要な場合は dependOnInheritedWidgetOfExactTypeメソッドでInheritedWidgetの子をビルドするようにする
      return (context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>())
          .data;
    }
    return (context
            .getElementForInheritedWidgetOfExactType<_MyInheritedWidget>()
            .widget as _MyInheritedWidget)
        .data;
  }
}

class _HomePageState extends State<_HomePage> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _MyInheritedWidget extends InheritedWidget {
  final _HomePageState data;
  _MyInheritedWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class _WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Stateを取得する
    final _HomePageState state = _HomePage.of(context);

    return Center(
      child: Text(
        '${state.counter}',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}

class _WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Inherit Sample');
  }
}

class _WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _HomePageState state = _HomePage.of(context, rebuild: false);

    return RaisedButton(
      onPressed: () {
        state._incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}
