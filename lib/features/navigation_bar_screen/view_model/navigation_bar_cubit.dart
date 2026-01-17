import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {

  NavigationBarCubit() : super(NavigationBarInitial());
  int currentIndex = 0;


  void changeIndex(int index) {
    emit(NavigationBarInitial());
    currentIndex = index;
    emit(NavigationBarChangeIndexState());
  }
}