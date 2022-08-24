import 'package:bloc_clean_architecture/features/counter/domain/entities/counter.dart';

class CounterModel extends CounterEntity {
  const CounterModel({
    required int count,
  }) : super(count: count);

  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(count: json['count'] ?? 0);
  }
}