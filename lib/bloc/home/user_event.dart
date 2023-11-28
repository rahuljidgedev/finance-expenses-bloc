part of 'user_bloc.dart';

@immutable
abstract class HomeEvent {}

class UserDataEvent extends HomeEvent {
  final String token;
  UserDataEvent(this.token);
}