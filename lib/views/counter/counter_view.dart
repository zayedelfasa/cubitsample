import 'package:cubitloginsample/views/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => counterCubit,
        child: BlocListener<CounterCubit, int>(
          listener: (context, state) {},
          child: Scaffold(
            appBar: AppBar(
              title: Text("Cubit counter"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  BlocBuilder<CounterCubit, int>(builder: (context, state) {
                    return Text(
                      '$state',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  })
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                counterCubit.increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ));
  }
}
