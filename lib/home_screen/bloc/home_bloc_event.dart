part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class IncrementEvent extends HomeBlocEvent {}

class DecrementEvent extends HomeBlocEvent {}
