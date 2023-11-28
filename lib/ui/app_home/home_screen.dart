import 'package:manage_finance_app/bloc/home/user_expense_bloc.dart';
import 'package:manage_finance_app/data/model/expense_data/UserExpense.dart';
import 'package:manage_finance_app/res/app_context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_finance_app/data/model/user_data/UserDataMain.dart';
import 'package:manage_finance_app/bloc/home/user_bloc.dart';
import 'package:manage_finance_app/ui/widget/app_widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserDataBloc _userBloc;
  late ExpenseBloc _expenseBloc;
  String selectedCountries = "in";
  String newsType = "";
  Finance _finance = Finance(userName: "", currentBudget: 0, expensesThisMonth: 0, lastMonthSavings: 0);
  List<Expense> _expense = List.empty();
  int currentPageIndex = 0;

  @override
  void initState() {
    _userBloc = BlocProvider.of(context);
    _userBloc.add(UserDataEvent("user-token"));
    _expenseBloc = BlocProvider.of(context);
    _expenseBloc.add(ExpenseDataEvent("user-token"));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: context.resources.color.colorAccent.shade50,
      appBar: AppWidgets.getAppBarWithTwoIcons(
          context,
          (context.resources.strings?.txtHello ?? "") +" "+_finance.userName ?? "",
              () {},
              () {},
          const Icon(Icons.notifications),
          const Icon(Icons.add_box_outlined)
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: context.resources.color.colorPrimary,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(Icons.home),
            icon: const Icon(Icons.home_outlined),
            label: context.resources.strings?.txtHome ?? "",
          ),
          NavigationDestination(
            icon:  Icon(Icons.arrow_circle_down, color: context.resources.color.colorExpenseNavigationIcon),
            label: context.resources.strings?.txtExpense ?? "",
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_circle_up, color: context.resources.color.colorEarningNavigationIcon),
            label: context.resources.strings?.txtEarning ?? "",
          ),
          NavigationDestination(
            icon: const Icon(Icons.monetization_on_outlined),
            label: context.resources.strings?.txtInvestment ?? "",
          ),
          NavigationDestination(
            icon: const Icon(Icons.account_circle_outlined),
            label: context.resources.strings?.txtProfile ?? "",
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        BlocConsumer<UserDataBloc, UserState>(
          builder: (context, state) {
            if (kDebugMode) {
              print("${HomeScreen.id} -->> $state");
            }
            if (state is UserDataLoading) {
              return AppWidgets.getCenterLoadingView();
            } else if (state is UserDataLoaded) {
              if (state.data.financial != null) {
                _finance = state.data.financial;
              } else {
                return AppWidgets.getBuildNoResult(context, context.resources.strings?.noNewsFound ?? "");
              }
            } else if (state is HomePageError) {
              _finance = Finance(
                  userName: "Rahul",
                  currentBudget: 250000,
                  lastMonthSavings: 10000,
                  expensesThisMonth: 12000
              );
              //return AppWidgets.getBuildNoResult(context, state.errorMessage);
            }
            return _setUserHome();
          },
          listener: (context, state) {},
        ),

        /// Expense page
        BlocConsumer<ExpenseBloc, ExpenseState>(
          builder: (context, state) {
            if (state is ExpenseDataLoading) {
              return AppWidgets.getCenterLoadingView();
            } else if (state is ExpenseDataLoaded) {
              if (state.data.expense != null) {
                _expense = state.data.expense;
              } else {
                return AppWidgets.getBuildNoResult(context, context.resources.strings?.noNewsFound ?? "");
              }
            } else if (state is ExpensePageError) {
              var li = List.empty(growable: true);
              li.add(Expense(date: "23/07/2023", name: "Electricity", expenses: 1080.0, budget: 5000.0, category: "Bill"));
              li.add(Expense(date: "24/07/2023", name: "Dinner", expenses: 380.0, budget: 5000.0, category: "Food"));
              li.add(Expense(date: "25/07/2023", name: "Diesel", expenses: 2250.0, budget: 5000.0, category: "Transport"));
              _expense = List.from(li);
              //return AppWidgets.getBuildNoResult(context, state.errorMessage);
            }
            return _setExpenseHome();
          },
          listener: (context, state) {},
        ),

        /// Earning
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.outdoor_grill_outlined,
                      size: context.resources.dimension.homeFallbackIconSize,
                      color: context.resources.color.colorAccent,
                    ),
                    Text(
                      context.resources.strings?.txtArtistryInMotion ?? "",
                      style: context.resources.style.homeArtistryInMotionTitle,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0,context.resources.dimension.homeSubtitleTopSpacing,0,0),
                      child:
                      Text(
                        context.resources.strings?.txtEarning ?? "",
                        style: context.resources.style.homeArtistryInMotionScreenName,
                      ),
                    )
                  ],
                )
            ),
          ),
        ),

        /// Messages page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.outdoor_grill_outlined,
                      size: context.resources.dimension.homeFallbackIconSize,
                      color: context.resources.color.colorAccent,
                    ),
                    Text(
                      context.resources.strings?.txtArtistryInMotion ?? "",
                      style: context.resources.style.homeArtistryInMotionTitle,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0,context.resources.dimension.homeSubtitleTopSpacing,0,0),
                      child:
                      Text(
                        context.resources.strings?.txtInvestment ?? "",
                        style: context.resources.style.homeArtistryInMotionScreenName,
                      ),
                    )
                  ],
                )
            ),
          ),
        ),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.outdoor_grill_outlined,
                    size: context.resources.dimension.homeFallbackIconSize,
                    color: context.resources.color.colorAccent,
                  ),
                  Text(
                    context.resources.strings?.txtArtistryInMotion ?? "",
                    style: context.resources.style.homeArtistryInMotionTitle,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0,context.resources.dimension.homeSubtitleTopSpacing,0,0),
                    child:
                    Text(
                      context.resources.strings?.txtProfile ?? "",
                      style: context.resources.style.homeArtistryInMotionScreenName,
                    ),
                  )
                ],
              )
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }

  Widget _setUserHome() {
    /*Create Graph here*/
    Map<String, double> map = {
      context.resources.strings?.txtBudgetInHand ?? "": (_finance.currentBudget- _finance.expensesThisMonth).toDouble(),
      context.resources.strings?.txtExpenses ?? "": _finance.expensesThisMonth.toDouble(),
    };

    return Container(
      margin: EdgeInsets.all(context.resources.dimension.homeCardMargin),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left:context.resources.dimension.defaultMargin,
                    top: context.resources.dimension.defaultMargin,
                  ),
                  child: Text(context.resources.strings?.txtBudgetAvailable ?? "", style: context.resources.style.homeProgressText),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left:context.resources.dimension.mediumMargin,
                    top: context.resources.dimension.mediumMargin,
                    bottom: context.resources.dimension.bigMargin
                  ),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * 0.7,
                    animation: true,
                    lineHeight: context.resources.dimension.homeBudgetBarHeight,
                    animationDuration: context.resources.dimension.homeAnimationDuration.toInt(),
                    percent: (((_finance.currentBudget -_finance.expensesThisMonth))/_finance.currentBudget),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: context.resources.color.colorPrimary,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(context.resources.dimension.mediumMargin),
              child: Text(context.resources.strings?.txtInvestmentVsExpenses ?? "", style: context.resources.style.homePieChartMessage),
            ),
            Container(
              child: PieChart(
                  dataMap: map,
                  animationDuration: Duration(milliseconds: context.resources.dimension.homeAnimationDuration.toInt()),
                  chartRadius: MediaQuery.of(context).size.width / 1.8,
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.bottom,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  gradientList: context.resources.color.gradientList,
                  baseChartColor: Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _setExpenseHome() {
    return ListView.builder(
      reverse: false,
      itemCount: _expense.length == 0 ? 1 : _expense.length,
      itemBuilder: (BuildContext context, int index) {
        if(_expense.length == 0 && index == 0){
          Card(
            child: ListTile(
              leading: Icon(Icons.broken_image),
              title: Text("No Data"),
            ),
          );
        }else {
          return Align(
              alignment: Alignment.centerRight,
              child:
              Container(
                margin: EdgeInsets.only(
                  top: context.resources.dimension.smallMargin,
                  left: context.resources.dimension.mediumMargin,
                  right: context.resources.dimension.mediumMargin,
                ),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.local_grocery_store),
                    title: Text(_expense[index].name),
                    subtitle: Text(_expense[index].category),
                  ),
                ),
              )
          );
        }
      },
    );
  }
}
