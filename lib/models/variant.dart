class Variant {
  int? id;
  String name;
  double price;
  int quantity;
  int itemId;

  Variant({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.itemId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'item_id': itemId,
    };
  }

  factory Variant.fromMap(Map<String, dynamic> map) {
    return Variant(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      itemId: map['item_id'],
    );
  }
}
