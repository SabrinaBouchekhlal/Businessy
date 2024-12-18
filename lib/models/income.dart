class Income {
  int? id;
  String date;
  int itemId;
  int userId;

  Income({
    this.id,
    required this.date,
    required this.itemId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'item_id': itemId,
      'user_id': userId,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'],
      date: map['date'],
      itemId: map['item_id'],
      userId: map['user_id'],
    );
  }
}
