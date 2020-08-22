import 'package:my_app/model/loading.dart';
import 'package:my_app/sample/toppage0.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model{
  final CountRepository _repository;
  final LoadingModel _loadingModel;

  int _counter = 0;

  int get counter => _counter;

  CounterModel(this._repository,this._loadingModel);

  void incrementCounter() async {
    _loadingModel.loading(true);
    var increaseCounte = await _repository.fetch().whenComplete((){
      _loadingModel.loading(false);
    });

    _counter += increaseCounte;

    // 変更をウィジェットに伝える
    notifyListeners();
  }
}