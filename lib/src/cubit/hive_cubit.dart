import 'package:flutter_app_tas/src/models/dhikr.dart';
import 'package:flutter_app_tas/src/utils/keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveCubit extends Cubit<List<Dhikr>> {
  late Box<Dhikr>? box;
  HiveCubit() : super([]);

  Future<void> openDhikrBox() async {
    box = await Hive.openBox(keyHiveDhikrsBox); // Открываем бокс
    emit(box!.values.toList());
  }

  void editDhikr(int? index, String? newTitle) {
    final counterOld = box!.getAt(index!)?.counter ?? 0;

    box!.putAt(
        index, // Изменяем старый  запись, на новый запись
        Dhikr(counter: counterOld, title: newTitle!, date: DateTime.now()));

    emit(box!.values.toList());
  }

  void deleteDhikr(int index) {
    box!.deleteAt(index); // Удаляем запись по индексу
    emit(box!.values.toList()); // Отправляем  список
  }

  void deleteAllDhikr() {
    box!.clear(); // Метод clear удаляет все записи из Hive box.
    emit([]); // Отправляем пустой список после удаления всех записей.
  }

  @override
  Future<void> close() async {
    // Закрывем бокс
    await box!.close();
    super.close();
  }
}
