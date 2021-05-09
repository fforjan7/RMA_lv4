import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'data/sharedPref.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lv3',
      home: BlocProvider(
        create: (context) => CounterBloc(SharedPreferencesHelper()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Bird Counter'),
          ),
          body: BlocConsumer<CounterBloc, CounterState>(
            listener: (_, __) {},
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.counter}',
                    style: TextStyle(
                      color: state.textColor,
                      fontSize: 100,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(IncrementBlueEvent());
                        },
                        child: Text(
                          'BLUE',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(IncrementGreenEvent());
                        },
                        child: Text(
                          'GREEN',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(IncrementYellowEvent());
                        },
                        child: Text(
                          'YELLOW',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(ResetEvent());
                    },
                    child: Text(
                      'RESET',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
