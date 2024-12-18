class Expense {
  int? id;
  String name;
  double amount;
  String type;
  int itemId;
  int userId;

  Expense({
    this.id,
    required this.name,
    required this.amount,
    required this.type,
    required this.itemId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'type': type,
      'item_id': itemId,
      'user_id': userId,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      type: map['type'],
      itemId: map['item_id'],
      userId: map['user_id'],
    );
  }
}
