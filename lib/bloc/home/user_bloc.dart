import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:manage_finance_app/data/model/user_data/UserDataMain.dart';
import 'package:manage_finance_app/repository/user/user_data_imp.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserDataBloc extends Bloc<HomeEvent, UserState> {

  final _userRepo = HomeRepoImp();
  int page = 1;
  bool haveMoreData = false;

  UserDataBloc() : super(UserInitial()) {
    on<UserDataEvent>(_fetchHomeProfileData);
  }

  FutureOr<void> _fetchHomeProfileData(HomeEvent event, Emitter<UserState> emit) async {
    if(event is UserDataEvent) {
      emit(UserDataLoading());
      await _userRepo
          .getUserData(event.token)
          .onError((error, stackTrace) => emit(HomePageError(error.toString())))
          .then((value) {
        UserData userDataMain = UserData.fromJson(value);
        if (userDataMain.status == "ok") {
          emit(UserDataLoaded(userDataMain));
        } else {
          emit(HomePageError(userDataMain.message));
        }
      });
    }
  }
}
