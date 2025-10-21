import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  int counter = 0;

  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<IncrementEvent>((event, emit) async {
      debugPrint(counter.toString());
      if (counter < 10) {
        counter++;
        await Future.delayed((Duration(seconds: 5)));
        emit(ChangeState(countValue: counter));
      } else {
        emit(ErrorState(msg: "The value is bigger then 10"));
      }
    }, transformer: concurrent());

    on<DecrementEvent>((event, emit) {
      debugPrint(counter.toString());

      if (counter > 0) {
        counter--;
        emit(ChangeState(countValue: counter));
      } else {
        emit(ErrorState(msg: "The value is less then 0"));
      }
    });
  }
}
