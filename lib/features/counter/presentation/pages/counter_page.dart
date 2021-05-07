import 'package:cubit_study/features/counter/presentation/blocs/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterCubit(), child: CounterView());
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text(
                '$state',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => context.read<CounterCubit>().decrement()),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => context.read<CounterCubit>().increment()),
            ],
          )
        ],
      ),
    );
  }
}
