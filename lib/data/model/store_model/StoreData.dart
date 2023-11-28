
class StoreExpenseData {
  StoreExpenseData({
    required this.id,
    required this.date,
    required this.amount,
    required this.category
  });

  final String id;
  final String date;
  final String amount;
  final String category;

  factory StoreExpenseData.fromJson(Map<String, dynamic> json){
    return StoreExpenseData(
      id: json["id"] ?? "",
      date: json["date"] ?? "",
      amount: json["amount"] ?? "",
      category: json["category"] ?? "",
    );
  }
}

class StoreBudgetData {
  StoreBudgetData({
    required this.id,
    required this.date,
    required this.amount,
  });

  final String id;
  final String date;
  final String amount;

  factory StoreBudgetData.fromJson(Map<String, dynamic> json){
    return StoreBudgetData(
      id: json["id"] ?? "",
      date: json["date"] ?? "",
      amount: json["amount"] ?? "",
    );
  }
}

class StoreEarningData {
  StoreEarningData({
    required this.id,
    required this.date,
    required this.amount,
  });

  final String id;
  final String date;
  final String amount;

  factory StoreEarningData.fromJson(Map<String, dynamic> json){
    return StoreEarningData(
      id: json["id"] ?? "",
      amount: json["amount"] ?? "",
      date: json["date"] ?? "",
    );
  }
}
