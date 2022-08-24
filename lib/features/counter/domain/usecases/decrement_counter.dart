import '../repositories/counter_repository.dart';

class DecrementCounterUseCase {
  final CounterRepository repository;

  DecrementCounterUseCase({
    required this.repository,
  });

  Future<void> call() => repository.decrement();
}