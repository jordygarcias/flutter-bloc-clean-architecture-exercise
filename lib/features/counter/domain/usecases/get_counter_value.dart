import 'package:bloc_clean_architecture/features/counter/domain/entities/counter.dart';
import 'package:bloc_clean_architecture/features/counter/domain/repositories/counter_repository.dart';

class GetCounterValueUseCase {
  final CounterRepository repository;

  GetCounterValueUseCase({
    required this.repository,
  });

  Future<CounterEntity> call() => repository.getCounterValue();
}