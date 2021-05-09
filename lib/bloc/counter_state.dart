part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  CounterState({
    this.counter,
    this.textColor,
    this.textColorInt,
  });
  final int counter;
  final Color textColor;
  final int textColorInt;
}

class CounterInitial extends CounterState {
  CounterInitial()
      : super(
          counter: 0,
          textColor: Colors.black,
          textColorInt: Colors.black.value,
        );
}

class Counter extends CounterState {
  Counter({
    counter,
    textColor,
    textColorInt,
  }) : super(
          counter: counter,
          textColor: textColor,
          textColorInt: textColorInt,
        );
}
