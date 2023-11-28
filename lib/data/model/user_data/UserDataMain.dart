
class UserData {
  UserData({
    required this.status,
    required this.message,
    required this.financial
  });

  final String status;
  final String message;
  final Finance financial;

  factory UserData.fromJson(Map<String, dynamic> json){
    return UserData(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      financial: json["financial"] == null ? Finance( userName: '', currentBudget: 0, expensesThisMonth: 0, lastMonthSavings: 0) : Finance.fromJson(json["financial"]!.map((x) => Finance.fromJson(x))),
    );
  }
}

class Finance{
  Finance({
    required this.userName,
    required this.currentBudget,
    required this.expensesThisMonth,
    required this.lastMonthSavings
  });
  final String userName;
  final int currentBudget;
  final int expensesThisMonth;
  final int lastMonthSavings;

  factory Finance.fromJson(Map<String, dynamic> json){
    return Finance(
      userName: json["userName"] ?? "",
      currentBudget: json["currentBudget"] ?? "",
      expensesThisMonth: json["expensesThisMonth"] ?? "",
      lastMonthSavings: json["lastMonthSavings"] ?? "",
    );
  }
}
