class Income {
  int? id;
  String date;
  int itemId;

  Income({
    this.id,
    required this.date,
    required this.itemId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'item_id': itemId,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'],
      date: map['date'],
      itemId: map['item_id'],
    );
  }
}
