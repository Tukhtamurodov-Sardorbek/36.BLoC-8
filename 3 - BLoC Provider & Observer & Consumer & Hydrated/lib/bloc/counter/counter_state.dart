part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({required this.counter});

  // * Insert all instances
  @override
  List<Object> get props => [counter];

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counter: map['counter']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());
  factory CounterState.fromJson(String source) => CounterState.fromMap(json.decode(source));
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0);
}

// * In order to Listen
class IncrementState extends CounterState {
  const IncrementState({required int increasedCounter}) : super(counter: increasedCounter);
}

class DecrementState extends CounterState {
  const DecrementState({required int decreasedCounter}) : super(counter: decreasedCounter);
}
