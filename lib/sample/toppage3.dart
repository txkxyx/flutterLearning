import 'dart:async';

import 'package:flutter/material.dart';

class CounterLogic {
  final _valueController = StreamController<int>();

  Stream<int> get value => _valueController.stream;

  int _counter = 0;

  CounterLogic() {
    _valueController.sink.add(_counter);
  }

  void incrementCounter() async {
    _valueController.sink.add(++_counter);
  }

  void dispose() {
    _valueController.close();
  }
}

class TopPage3_0 extends StatefulWidget {
  @override
  _TopPgaeState createState() => _TopPgaeState();
}

class _TopPgaeState extends State<TopPage3_0> {
  CounterLogic counterLogic;

  @override
  void initState() {
    super.initState();
    counterLogic = CounterLogic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Simple Sample'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _WidgetA(counterLogic),
          _WidgetB(),
          _WidgetC(counterLogic)
        ],
      ),
    );
  }

  @override
  void dispose() {
    counterLogic.dispose();
    super.dispose();
  }
}

class _WidgetA extends StatelessWidget {
  final CounterLogic counterLogic;

  _WidgetA(this.counterLogic);

  @override
  Widget build(BuildContext context) {
    return Center(
      // StreamBuilder
      child: StreamBuilder(
        stream: counterLogic.value,
        // 非同期処理もOK
        builder: (context, snapshot) {
          return Text(
            '${snapshot.data}',
            style: Theme.of(context).textTheme.display1,
          );
        },
      ),
    );
  }
}

class _WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Stream Builder Sample');
  }
}

class _WidgetC extends StatelessWidget {
  final CounterLogic counterLogic;

  _WidgetC(this.counterLogic);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        counterLogic.incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}
