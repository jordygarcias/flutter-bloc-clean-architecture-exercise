import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/counter/presentation/bloc/counter_bloc.dart';
import 'features/counter/presentation/views/counter_view.dart';
import 'injection_manager.dart' as injection;

void main() async {
  await injection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (_) => injection.getIt<CounterBloc>(),
        child: const CounterView(),
      ),
    );
  }
}