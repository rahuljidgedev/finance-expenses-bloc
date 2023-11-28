part of 'user_expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseDataLoading extends ExpenseState {}

class ExpenseDataMore extends ExpenseState {}

class ExpenseDataLoaded extends ExpenseState {
  late final UserExpense data;
  ExpenseDataLoaded(this.data);
}

class ExpensePagingLoaded extends ExpenseState {
  late final UserExpense data;
  ExpensePagingLoaded(this.data);
}

class ExpenseMorePageLoaded extends ExpenseState {
  late final UserExpense data;
  ExpenseMorePageLoaded(this.data);
}

class ExpensePageError extends ExpenseState {
  late final String errorMessage;
  ExpensePageError(this.errorMessage);
}
