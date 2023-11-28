
class UserExpense {
  UserExpense({
    required this.status,
    required this.message,
    required this.expense
  });

  final String status;
  final String message;
  final List<Expense> expense;

  factory UserExpense.fromJson(Map<String, dynamic> json){
    return UserExpense(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      expense: json["expense"] == null ?  [] : List<Expense>.from(json["expense"]!.map((x) => Expense.fromJson(x))),
    );
  }
}


class Expense {
  Expense({
    required this.date,
    required this.name,
    required this.expenses,
    required this.budget,
    required this.category,
  });
  final String date;
  final String name;
  final double expenses;
  final double budget;
  final String category;

  factory Expense.fromJson(Map<String, dynamic> json){
    return Expense(
      date: json["date"] ?? 0,
      name: json["name"] ?? "",
      expenses: json["expenses"] ?? 0,
      budget: json["budget"] ?? 0,
      category: json["category"] ?? "",
    );
  }
}