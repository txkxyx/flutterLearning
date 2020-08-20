import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/sample/toppage0.dart';

class CounterBloc {
  final CountRepository _repository;
  final LoadingBloc _loadingBloc;

  final _valueController = StreamController<int>();

  Stream<int> get value => _valueController.stream;

  int _counter = 0;

  CounterBloc(this._repository, this._loadingBloc) {
    _valueController.sink.add(_counter);
  }

  void incrementCounter() async {
    _loadingBloc.loading(isLoading: true);
    var increaseCount = await _repository.fetch().whenComplete(() {
      _loadingBloc.loading(isLoading: false);
    });
    _counter += increaseCount;

    _valueController.sink.add(_counter);
  }

  void dispose() {
    _valueController.close();
  }
}

class LoadingBloc {
  LoadingBloc() {
    loading(isLoading: false);
  }

  final _valueController = StreamController<bool>();

  Stream<bool> get value => _valueController.stream;

  loading({bool isLoading = false}) {
    _valueController.sink.add(isLoading);
  }

  void dispose() {
    _valueController.close();
  }
}

class LoadingWidget1 extends StatelessWidget {
  final Stream stream;

  const LoadingWidget1(this.stream);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: stream,
      builder: (context, snapshot) {
        return (snapshot.data)
            ? const DecoratedBox(
                decoration: BoxDecoration(color: Color(0x44000000)),
                child: Center(
                  child: CircularProgressIndicator(),
                ))
            : const SizedBox.shrink();
      },
    );
  }
}

class TopPage3_1 extends StatelessWidget {
  final CountRepository _repository;

  TopPage3_1(this._repository);

  @override
  Widget build(BuildContext context) {
    return _HomePage(
      repository: _repository,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget BLoC Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _WidgetA(),
            _WidgetB(),
            _WidgetC(),
          ],
        ),
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  final CountRepository repository;

  _HomePage({
    Key key,
    this.repository,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _HomePageState createState() => _HomePageState();

  static _HomePageState of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
      return (context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>()).data;
    }
    return (context.getElementForInheritedWidgetOfExactType<_MyInheritedWidget>().widget as _MyInheritedWidget).data;
    // return (context.findAncestorWidgetOfExactType<_MyInheritedWidget>()).data; // O(n)
  }
}

class _HomePageState extends State<_HomePage> {
  LoadingBloc loadingBloc;
  CounterBloc counterBloc;

  @override
  void initState() {
    super.initState();
    loadingBloc = LoadingBloc();
    counterBloc = CounterBloc(widget.repository, loadingBloc);
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(
      data: this,
      child: Stack(
        children: <Widget>[
          widget.child,
          LoadingWidget1(loadingBloc.value),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    loadingBloc.dispose();
    counterBloc.dispose();
  }
}

class _MyInheritedWidget extends InheritedWidget {
  _MyInheritedWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final _HomePageState data;

  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget) {
    return true;
  }
}

class _WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetA#build()");
    final state = _HomePage.of(context, rebuild: false);

    return Center(
        child: StreamBuilder(
      stream: state.counterBloc.value,
      builder: (context, snapshot) {
        return Text(
          '${snapshot.data}',
          style: Theme.of(context).textTheme.display1,
        );
      },
    ));
  }
}

class _WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetB#build()");
    return const Text('I am a widget that will not be rebuilt.');
  }
}

class _WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetC#build()");
    final state = _HomePage.of(context, rebuild: false);
    return RaisedButton(
      onPressed: () {
        state.counterBloc.incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}