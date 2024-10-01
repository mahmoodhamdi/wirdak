import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ziker_state.dart';

class ZikerCubit extends Cubit<ZikerState> {
  ZikerCubit(int initialCount) : super(ZikerState(count: initialCount));

  void increment() {
    final newCount = state.count > 0 ? state.count - 1 : 0;
    emit(ZikerState(count: newCount, isFavorite: state.isFavorite));
  }

  void toggleFavorite() {
    emit(ZikerState(count: state.count, isFavorite: !state.isFavorite));
  }
}
