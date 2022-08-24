part of 'counter_bloc.dart';

abstract class CounterState {
  final int? count;

  CounterState({ this.count });
}

class Initial extends CounterState {
  Initial() : super(count: 0);
}

class CounterChanged extends CounterState {
  CounterChanged(CounterEntity counter) : super(count: counter.count);
}