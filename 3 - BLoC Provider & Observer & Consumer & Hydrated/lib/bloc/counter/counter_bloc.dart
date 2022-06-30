import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/bloc_imports.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()){
    on<CounterIncrementEvent> ((event, emit){
      // emit(CounterState(counter: state.counter + 1));
      emit(IncrementState(increasedCounter: state.counter + 1)); // Added Listener
    });
    on<CounterDecrementEvent> ((event, emit){
      // emit(CounterState(counter: state.counter - 1));
      emit(DecrementState(decreasedCounter: state.counter - 1)); // Added Listener
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) => CounterState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(CounterState state) => state.toMap();
}
