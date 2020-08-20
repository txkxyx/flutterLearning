import 'package:flutter/material.dart';

class TopPage0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setState Demo'),
      ),
      body: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {
  int _counter = 0;
  bool _isLoading = false;
  CountRepository repository = CountRepository();

  void _incrementCounter() async {
    setState(() {
      _isLoading = true;
    });
    repository.fetch().then((increaseCount) {
      setState(() {
        _counter += increaseCount;
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _WidgetA(_counter),
        _WidgetB(),
        _WidgetC(_incrementCounter),
        LoadingWidget0(_isLoading)
      ],
    );
  }
}

class _WidgetA extends StatelessWidget {
  final int counter;

  _WidgetA(this.counter);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${counter}',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}

class _WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Counter Sample App');
  }
}

class _WidgetC extends StatelessWidget {
  final void Function() incrementCounter;

  _WidgetC(this.incrementCounter);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}

class CountRepository {
  Future<int> fetch() {
    return Future.delayed(const Duration(seconds: 1)).then((_) {
      return 1;
    });
  }
}

class LoadingWidget0 extends StatelessWidget {
  final bool isLoading;

  LoadingWidget0(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : const SizedBox.shrink();
  }
}
