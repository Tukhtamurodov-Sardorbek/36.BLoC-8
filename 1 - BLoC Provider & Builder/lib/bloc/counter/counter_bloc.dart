import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// * Convert Events To State
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()){
    on<CounterIncrementEvent> ((event, emit){
      emit(CounterState(counter: state.counter + 1));
    });
    on<CounterDecrementEvent> ((event, emit){
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
