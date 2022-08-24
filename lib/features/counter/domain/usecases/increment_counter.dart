import '../repositories/counter_repository.dart';

class IncrementCounterUseCase {
  final CounterRepository counterRepository;

  IncrementCounterUseCase({required this.counterRepository});

  Future<void> call() => counterRepository.increment();
}