import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/sample/toppage0.dart';
import 'package:provider/provider.dart';

class LoadingBloc {
  LoadingBloc() {
    loading(false);
  }

  final _valueController = StreamController<bool>();

  Stream<bool> get value => _valueController.stream;

  loading(bool loading) {
    _valueController.sink.add(loading);
  }

  void dispose() {
    _valueController.close();
  }
}

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
    _loadingBloc.loading(true);

    var increaseCount = await _repository.fetch().whenComplete(() {
      _loadingBloc.loading(false);
    });

    _counter += increaseCount;

    _valueController.sink.add(_counter);
  }

  void dispose() {
    _valueController.close();
  }
}

class TopPage3 extends StatelessWidget {
  final CountRepository _repository;

  TopPage3(this._repository);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoadingBloc>(
          create: (_) => LoadingBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<CounterBloc>(
          create: (context) {
            var bloc = Provider.of<LoadingBloc>(context, listen: false);
            return CounterBloc(_repository, bloc);
          },
          dispose: (_, bloc) => bloc.dispose(),
        )
      ],
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text('Bloc Provider Demo'),
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
          const LoadingWidget3()
        ],
      ),
    );
  }
}

class _WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetA#build()");
    var bloc = Provider.of<CounterBloc>(context, listen: false);
    return Center(
      child: StreamBuilder<int>(
        stream: bloc.value,
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
    print("called _WidgetB#build()");
    return const Text('I am a widget that will not be rebuilt.');
  }
}

class _WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetC#build()");
    return RaisedButton(
      onPressed: () {
        Provider.of<CounterBloc>(context, listen: false).incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}

class LoadingWidget3 extends StatelessWidget {
  const LoadingWidget3();

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoadingBloc>(context);
    return StreamBuilder<bool>(
        initialData: false,
        stream: bloc.value,
        builder: (context, snapshot) {
          return (snapshot.data)
              ? const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0x44000000),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox.shrink();
        });
  }
}