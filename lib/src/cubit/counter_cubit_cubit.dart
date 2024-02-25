import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterState {
  int count;

  CounterState(this.count);
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0)) {
    getCounter();
  }
  void updateCounterByIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    switch (index) {
      case 0:
        emit(CounterState(state.count + 1));
        prefs.setInt('counter', state.count);
        break;
      case 1:
        if (state.count > 0) {
          emit(CounterState(state.count - 1));
          prefs.setInt('counter', state.count);
        }
        break;
      case 2:
        if (state.count != 0) {
          emit(CounterState(0));
          prefs.setInt('counter', state.count);
        }
    }
  }

  void getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    int savedCounter = prefs.getInt('counter') ?? 0;
    emit(CounterState(savedCounter));
  }
}
