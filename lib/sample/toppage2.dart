import 'package:flutter/material.dart';
import 'package:my_app/model/counter.dart';
import 'package:my_app/model/loading.dart';
import 'package:my_app/sample/toppage0.dart';
import 'package:scoped_model/scoped_model.dart';

class TopPage2 extends StatelessWidget {
  final CountRepository _repository;
  final LoadingModel _loadingModel;

  TopPage2(this._repository, this._loadingModel);

  @override
  Widget build(BuildContext context) {
    // 最上位にScopedModelをインスタンス化しモデルを設定する
    return ScopedModel(
      model: _loadingModel,
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text('Scoped Model Demo'),
            ),
            body: ScopedModel(
              model: CounterModel(_repository, _loadingModel),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _WidgetA(),
                  _WidgetB(),
                  _WidgetC(),
                ],
              ),
            ),
          ),
          const LoadingWidget(),
        ],
      ),
    );
  }
}

class _WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetA#build()");

// こっちの書き方だとbuildメソッドがリビルドさせる
//    var model = ScopedModel.of<CounterModel>(context, rebuildOnChange: true);
//    return Center(
//      child: Text(
//        '${model.counter}',
//        style: Theme.of(context).textTheme.display1,
//      ),
//    );

    // こっちは、builderの中だけリビルドされる
    return Center(
      child: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return Text(
            '${model.counter}',
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
    // この場合は、リビルドする必要がないのでこの書き方の方がシンプル
    return RaisedButton(
      onPressed: () {
        ScopedModel.of<CounterModel>(context, rebuildOnChange: false).incrementCounter();
      },
      child: Icon(Icons.add),
    );

//    return ScopedModelDescendant<CounterModel>(
//      rebuildOnChange: false,
//      builder: (context, child, model) {
//        return RaisedButton(
//          onPressed: () {
//            model.incrementCounter();
//          },
//          child: Icon(Icons.add),
//        );
//      },
//    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, LoadingModel model) {
        return (model.value)
            ? const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0x44000000),
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}