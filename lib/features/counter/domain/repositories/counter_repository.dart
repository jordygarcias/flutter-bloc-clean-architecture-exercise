import '../entities/counter.dart';

abstract class CounterRepository {
  Future<void> increment();
  Future<void> decrement();
  Future<CounterEntity> getCounterValue();
}