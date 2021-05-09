import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../data/sharedPref.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  SharedPreferencesHelper sPrefHelper;

  CounterBloc(this.sPrefHelper) : super(CounterInitial()) {
    add(InitData());
  }

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is InitData) {
      final data = await sPrefHelper.getStartupValues();
      if (data['counter'] != null && data['textColorInt'] != null) {
        yield Counter(
            counter: data['counter'],
            textColor: Color(data['textColorInt']),
            textColorInt: data['texColorInt']);
      }
      else{
        yield CounterInitial();
      }
    }
    if (event is IncrementBlueEvent) {
      sPrefHelper.storeCounter(state.counter+1, Colors.blue.value);
      yield Counter(
        counter: state.counter + 1,
        textColor: Colors.blue,
        textColorInt: Colors.blue.value,
      );
    }
    if (event is IncrementYellowEvent) {
      sPrefHelper.storeCounter(state.counter+1, Colors.yellow.value);
      yield Counter(
        counter: state.counter + 1,
        textColor: Colors.yellow,
        textColorInt: Colors.yellow.value,
      );
    }
    if (event is IncrementGreenEvent) {
      sPrefHelper.storeCounter(state.counter+1, Colors.green.value);
      yield Counter(
        counter: state.counter + 1,
        textColor: Colors.green,
        textColorInt: Colors.green.value,
      );
    }
    if (event is ResetEvent) {
      sPrefHelper.resetCounter();
      yield Counter(
        counter: 0,
        textColor: Colors.black,
        textColorInt: Colors.black.value,
      );
    }
  }
}
