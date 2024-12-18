class Item {
  int? id;
  String name;
  double price;
  int quantity;
  String itemImage;
  int categoryId;
  int userId;

  Item({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.itemImage,
    required this.categoryId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'item_image': itemImage,
      'category_id': categoryId,
      'user_id': userId,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      itemImage: map['item_image'],
      categoryId: map['category_id'],
      userId: map['user_id'],
    );
  }
}
