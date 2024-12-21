class History {
  int? id;
  int expenseId;
  String date;

  History({
    this.id,
    required this.expenseId,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expense_id': expenseId,
      'date': date,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      id: map['id'],
      expenseId: map['expense_id'],
      date: map['date'],
    );
  }
}
