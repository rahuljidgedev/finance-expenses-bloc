part of 'user_expense_bloc.dart';

@immutable
abstract class ExpenseEvent {}

class ExpenseDataEvent extends ExpenseEvent {
  final String token;
  ExpenseDataEvent(this.token);
}