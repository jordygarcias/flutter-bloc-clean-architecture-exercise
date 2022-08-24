import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) => Text('${state.count}', style: const TextStyle(fontSize: 22)),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () => dispatchIncrementEvent(context),
                icon: const Icon(Icons.add),
                label: const SizedBox()
              ),
              ElevatedButton.icon(
                onPressed: () => dispatchDecrementEvent(context),
                icon: const Icon(Icons.remove),
                label: const SizedBox()
              ),
            ]
          )
        ]
      )
    );
  }

  void dispatchIncrementEvent(BuildContext context) {
    BlocProvider.of<CounterBloc>(context).add(IncrementCounterValue());
  }

  void dispatchDecrementEvent(BuildContext context) {
    BlocProvider.of<CounterBloc>(context).add(DecrementCounterValue());
  }
}