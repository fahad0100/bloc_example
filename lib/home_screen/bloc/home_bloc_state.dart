part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

final class ChangeState extends HomeBlocState {
  final int countValue;

  ChangeState({required this.countValue});
}

final class ErrorState extends HomeBlocState {
  final String msg;

  ErrorState({required this.msg});
}
