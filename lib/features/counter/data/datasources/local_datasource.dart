import '../models/counter_model.dart';

class CounterLocalDataSource {
  CounterModel counter = const CounterModel(
    count: 0
  );

  Future<CounterModel> getCounterValue() async
    => Future.value(counter);

  Future<void> increment() async {
    final newCounter = CounterModel(
      count: counter.count + 1
    );
    counter = newCounter;
  }

  Future<void> decrement() async {
    final newCounter = CounterModel(
      count: counter.count - 1
    );
    counter = newCounter;
  }
}