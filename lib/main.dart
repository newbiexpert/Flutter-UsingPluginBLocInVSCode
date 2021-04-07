import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_plugin_bloc/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc cbloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("new flutter_bloc")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, counterState) => Text(
              counterState.value.toString(),
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  cbloc.add(Decrement());
                },
                child: Icon(Icons.arrow_downward),
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  cbloc.add(Increment());
                },
                child: Icon(Icons.arrow_upward),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
