import 'package:bloc_clean_architecture/features/counter/data/datasources/local_datasource.dart';
import 'package:bloc_clean_architecture/features/counter/domain/entities/counter.dart';
import 'package:bloc_clean_architecture/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<void> decrement() => localDataSource.decrement();

  @override
  Future<CounterEntity> getCounterValue() => localDataSource.getCounterValue();

  @override
  Future<void> increment() => localDataSource.increment();

}