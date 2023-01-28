// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learnbloc_aj/bloc/bloc_import.dart';
import 'package:learnbloc_aj/bloc/counter/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: BlocConsumer<CounterBloc, CounterState>(
                  listener: (context, state) {
                    if (state is IncrementState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('State Increase change succesfully'),
                        duration: Duration(milliseconds: 500),
                      ));
                    } else if (state is DecrementState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('State Decrease change succesfully'),
                        duration: Duration(milliseconds: 500),
                      ));
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      'Counter value: ${state.counterValue}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          context.read<CounterBloc>().add(DecrementEvent()),
                      icon: Icon(Icons.remove),
                      label: Text('Decrease'),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          context.read<CounterBloc>().add(IncrementEvent()),
                      icon: Icon(Icons.add),
                      label: Text('Increase'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
