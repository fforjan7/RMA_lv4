part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class InitData extends CounterEvent{}

class IncrementGreenEvent extends CounterEvent{}

class IncrementBlueEvent extends CounterEvent{}

class IncrementYellowEvent extends CounterEvent{}

class ResetEvent extends CounterEvent {}