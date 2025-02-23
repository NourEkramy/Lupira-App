import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// State Class
class BaseScreenState {
  final int selectedTabIndex;

  BaseScreenState(this.selectedTabIndex);
}

// Cubit Class
class BaseScreenCubit extends Cubit<BaseScreenState> {
  BaseScreenCubit() : super(BaseScreenState(0));

  void changeTab(int index) {
    emit(BaseScreenState(index));
  }
}
