import 'package:bloc_clean_architecture/features/counter/domain/repositories/counter_repository.dart';
import 'package:get_it/get_it.dart';

import 'features/counter/data/datasources/local_datasource.dart';
import 'features/counter/data/repositories/counter_repository_impl.dart';
import 'features/counter/domain/usecases/decrement_counter.dart';
import 'features/counter/domain/usecases/get_counter_value.dart';
import 'features/counter/domain/usecases/increment_counter.dart';
import 'features/counter/presentation/bloc/counter_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => CounterBloc(
    getCounterValueUseCase: getIt(),
    incrementCounterUseCase: getIt(),
    decrementCounterUseCase: getIt(),
  ));

  // UseCases
  getIt.registerLazySingleton(() => GetCounterValueUseCase(
    repository: getIt(),
  ));
  getIt.registerLazySingleton(() => IncrementCounterUseCase(
    counterRepository: getIt(),
  ));
  getIt.registerLazySingleton(() => DecrementCounterUseCase(
    repository: getIt(),
  ));

  // Repository
  getIt.registerLazySingleton<CounterRepository>(() => CounterRepositoryImpl(
    localDataSource: getIt(),
  ));

  getIt.registerLazySingleton<CounterLocalDataSource>(() => CounterLocalDataSource());
}