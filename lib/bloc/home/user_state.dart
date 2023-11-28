part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserDataLoading extends UserState {}

class UserDataMore extends UserState {}

class UserDataLoaded extends UserState {
  late final UserData data;
  UserDataLoaded(this.data);
}

class HomePagingLoaded extends UserState {
  late final UserData data;
  HomePagingLoaded(this.data);
}

class HomeMorePageLoaded extends UserState {
  late final UserData data;
  HomeMorePageLoaded(this.data);
}

class HomePageError extends UserState {
  late final String errorMessage;
  HomePageError(this.errorMessage);
}
