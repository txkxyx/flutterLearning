import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.start,
              children: <Widget>[
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            icon: Icon(Icons.person),
                            hintText: '名前を入力してください',
                            labelText: '名前',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return '必須です';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
                                Scaffold.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Processing Date'),
                                ));
                              }
                            },
                            child: Text('Submit'),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
