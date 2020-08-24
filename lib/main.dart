import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home_Page(),
    );
  }
}

// ignore: camel_case_types
class Home_Page extends StatefulWidget {
  const Home_Page({
    Key key,
  }) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

// ignore: camel_case_types
class _Home_PageState extends State<Home_Page> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSeen = true;
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Click the FAB'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: _isSeen ? Colors.white : Colors.red,
            ),
            onPressed: () {
              setState(() {
                _isSeen = !_isSeen;
                _counter++;

                if (_counter % 2 == 0) {
                  _scaffoldKey.currentState
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text("Normal Snackbar")),
                    );
                } else {
                  _scaffoldKey.currentState
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Text label'),
                        action: SnackBarAction(
                          label: 'Action',
                          onPressed: () {
                            DateTime today = new DateTime.now();
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text("Diálogo con la fecha actual"),
                                  content: Text("Fecha actual: $today"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Aceptar"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                }
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Contador: $_counter"),
          ],
        ),
      ),
    );
  }
}
