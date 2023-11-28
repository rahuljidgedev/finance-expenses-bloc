import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:manage_finance_app/repository/user/user_data_imp.dart';
import 'package:flutter/material.dart';

import '../../data/model/expense_data/UserExpense.dart';

part 'user_expense_event.dart';
part 'user_expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseDataEvent, ExpenseState> {

  final _userRepo = HomeRepoImp();
  int page = 1;
  bool haveMoreData = false;

  ExpenseBloc() : super(ExpenseInitial()) {
    on<ExpenseDataEvent>(_fetchHomeProfileData);
  }

  FutureOr<void> _fetchHomeProfileData(ExpenseDataEvent event, Emitter<ExpenseState> emit) async {
    if(event is ExpenseDataEvent) {
      emit(ExpenseDataLoading());
      await _userRepo
          .getUserData(event.token)
          .onError((error, stackTrace) => emit(ExpensePageError(error.toString())))
          .then((value) {
        UserExpense expenseData = UserExpense.fromJson(value);
        if (expenseData.status == "ok") {
          emit(ExpenseDataLoaded(expenseData));
        } else {
          emit(ExpensePageError(expenseData.message));
        }
      });
    }
  }
}
