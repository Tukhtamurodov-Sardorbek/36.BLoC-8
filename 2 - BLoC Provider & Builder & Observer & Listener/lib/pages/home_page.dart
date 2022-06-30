import 'package:bloc_counter_app/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Counter',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is IncrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Successfully increased...',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.deepPurpleAccent.shade700,
                      elevation: 20.0,
                      shape: const StadiumBorder(),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(10.0),
                      duration: const Duration(milliseconds: 600),
                      dismissDirection: DismissDirection.horizontal,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Successfully decreased...',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.deepPurpleAccent.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 20.0,
                      shape: const StadiumBorder(),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(10.0),
                      duration: const Duration(milliseconds: 600),
                      dismissDirection: DismissDirection.horizontal,
                    ),
                  );
                }
              },
              child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                return Text(
                  'Counter:  ${state.counter}',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterDecrementEvent()),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: Colors.deepPurpleAccent.shade700,
                  ),
                  child: const Icon(
                    Icons.exposure_minus_1_outlined,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 60),
                ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterIncrementEvent()),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: Colors.deepPurpleAccent.shade700,
                  ),
                  child: const Icon(
                    Icons.plus_one_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
