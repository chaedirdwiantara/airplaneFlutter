import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    print('state $state');
    if (!isSelected(id)) {
      emit(List.from(state)..add(id));
    } else {
      emit(List.from(state)..remove(id));
    }
  }

  bool isSelected(String id) {
    return state.contains(id);
  }
}
