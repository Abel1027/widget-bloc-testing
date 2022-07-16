import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<int> {
  MyCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
