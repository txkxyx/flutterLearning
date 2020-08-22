import 'package:flutter/material.dart';
import 'package:my_app/material/material.dart';
import 'package:my_app/model/loading.dart';
import 'package:my_app/sample/toppage0.dart';
import 'package:my_app/sample/toppage1.dart';
import 'package:my_app/sample/toppage2.dart';
import 'package:my_app/sample/toppage3.dart';
import 'package:my_app/sample/toppage3_0.dart';
import 'package:my_app/sample/toppage3_1.dart';
import 'package:my_app/widget/input/input.dart';
import 'package:my_app/widget/interaction/interraction.dart';
import 'package:my_app/widget/scroll/scrollPage.dart';
import 'widget/basic/text.dart';
import 'widget/basic/image.dart';
import 'widget/basic/icon.dart';
import 'widget/singleChild/container.dart';
import 'widget/multiChild/columnRow.dart';
import './widget/paintEffect/paintEffect.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Material Theme
      // アプリ内の統一的なテーマを指定する
      theme: ThemeData(
          // アプリ全体のカラー
          primarySwatch: Colors.blue,
          //アクセントカラー
          accentColor: Colors.red,
          //ボタンやテキスト・アイコンの設定
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            // ボタンの角を調整
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
          ),
          iconTheme:
              const IconThemeData.fallback().copyWith(color: Colors.red)),
      // Darkモードのテーマを指定する
      darkTheme: ThemeData(),
      home: MyHomePage(title: 'Flutter Sapmle App',),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  final CountRepository _repository = CountRepository();

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('setStateの場合'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TopPage0();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('InheritedWidgetの場合'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TopPage1();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('SamplePageへ'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FirstPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('StreamBuilderへ'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TopPage3_0();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('StreamBuilder + InheritWidget'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TopPage3_1(_repository);
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Bloc Provier Sample'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TopPage3(_repository);
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Scoped Model Sample'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TopPage2(_repository, LoadingModel());
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Column(
        children: <Widget>[
          Wrap(children: <Widget>[
            RaisedButton(
              onPressed: () async {
                var message = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return SecondPage('From FirstPage');
                        },
                        fullscreenDialog: true));
                print(message);
              },
              child: Text('First Page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TextPage();
                }));
              },
              child: Text('Text Page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImagePage();
                }));
              },
              child: Text('Image Page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return IconPage();
                }));
              },
              child: Text('Icon Page'),
            ),
          ]),
          Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ContainerPage();
                  }));
                },
                child: Text('Container Page'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ColumnRowPage();
                  }));
                },
                child: Text('MultiChild Page'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaintEffectPage();
                  }));
                },
                child: Text('PainteEffect Page'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScrollPage();
                  }));
                },
                child: Text('Scroll Page'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InputPage();
                  }));
                },
                child: Text('Input Page'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InteractionPage();
                  }));
                },
                child: Text('Interaction Page'),
              ),
            ],
          ),
          Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MaterialPage();
                  }));
                },
                child: Text('Material Page'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String message;
  SecondPage(this.message);
  Widget build(BuildContext context) {
    // var message = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context, 'From SecondPage');
          },
          child: Text(this.message),
        ),
      ),
    );
  }
}
