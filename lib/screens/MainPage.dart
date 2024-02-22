import 'dart:async';

import 'package:flutter/material.dart';
import 'package:js/js.dart' as js;
import 'package:js/js_util.dart' as js_utils;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

@js.JSExport()
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String title="";
  final _streamController = StreamController.broadcast();
  final _TitleController = StreamController.broadcast();

  @override
  void initState(){
    super.initState();
    final export = js_utils.createDartExport(this);

    js_utils.setProperty(js_utils.globalThis, "_appState", export);
    js_utils.callMethod(js_utils.globalThis, "_stateSet", []);
  }


  @js.JSExport()
  void addHandler(void Function() handler){
    _streamController.stream.listen((event) {
      handler();
    });
  }

  @js.JSExport()
  int get count => _counter;

  @js.JSExport()
  void increment() {
    setState(() {
      _counter++;
      _streamController.add(null);

    });
  }

  @js.JSExport()
  void Decrement() {
    setState(() {
      _counter--;
      _streamController.add(null);

    });
  }

  @js.JSExport()
  void setTitle(String _title) {
    setState(() {
      title = _title;
      _TitleController.add(null);

    });
  }

  @override
  void dispose(){
    _streamController.close();
    _TitleController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}