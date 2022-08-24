import 'package:bloc_clean_architecture/features/counter/domain/entities/counter.dart';
import 'package:bloc_clean_architecture/features/counter/domain/usecases/decrement_counter.dart';
import 'package:bloc_clean_architecture/features/counter/domain/usecases/get_counter_value.dart';
import 'package:bloc_clean_architecture/features/counter/domain/usecases/increment_counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final GetCounterValueUseCase getCounterValueUseCase;
  final IncrementCounterUseCase incrementCounterUseCase;
  final DecrementCounterUseCase decrementCounterUseCase;

  CounterBloc({
    required this.getCounterValueUseCase,
    required this.incrementCounterUseCase,
    required this.decrementCounterUseCase
  }) : super (Initial()) {
    on<IncrementCounterValue>((event, emit) async {
      await incrementCounterUseCase();
      final counter = await getCounterValueUseCase();
      emit(CounterChanged(counter));
    });
    on<DecrementCounterValue>((event, emit) async {
      await decrementCounterUseCase();
      final counter = await getCounterValueUseCase();
      emit(CounterChanged(counter));
    });
  }
}