import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NamazCounterState {
  int namazCounter;
  String tasbeehName = "SubhanAllah";
  NamazCounterState(this.namazCounter, this.tasbeehName);
}

class NamazCounterCubit extends Cubit<NamazCounterState> {
  NamazCounterCubit() : super(NamazCounterState(0, "SubhanAllah"));

  void incrementNamazTasbeeh() {
    if (state.namazCounter < 32) {
      emit(
        NamazCounterState(state.namazCounter + 1, state.tasbeehName),
      );
    } else {
      HapticFeedback.heavyImpact();
      emit(
        NamazCounterState(0, nextTasbeehName(state.tasbeehName)),
      );
    }
  }

  String nextTasbeehName(String currentTasbeehName) {
    if (currentTasbeehName == 'SubhanAllah') {
      return 'Alhamdulillah';
    } else if (currentTasbeehName == 'Alhamdulillah') {
      return 'Allahu Akbar';
    } else {
      return 'SubhanAllah';
    }
  }
}
