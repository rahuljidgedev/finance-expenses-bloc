import 'package:manage_finance_app/bloc/home/user_expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/app_home/home_screen.dart';
import '../bloc/home/user_bloc.dart';

class RouteGenerator {

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
            builder: (_)=> MultiBlocProvider(
              providers: [
                BlocProvider<UserDataBloc>.value(
                  value: UserDataBloc(),
                ),
                BlocProvider<ExpenseBloc>.value(
                  value: ExpenseBloc(),
                ),
              ], child: const HomeScreen(),
            )
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
