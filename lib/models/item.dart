import 'package:businessy/models/category.dart';
import 'package:businessy/models/expense.dart';
import 'package:businessy/models/variant.dart';

class Item {
  int? id;
  String name;
  double price;
  int quantity;
  String itemImage;
  Category category;
  List<Variant>? variants;
  List<Expense>? expenses;

  Item({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.itemImage,
    required this.category,
    this.variants,
    this.expenses,
  });

  // Convert object to a Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'item_image': itemImage,
      'category': category,
      'variants': variants != null ? variants!.map((v) => v.toMap()).toList() : null, // Convert variants to Map
      'expenses': expenses != null ? expenses!.map((e) => e.toMap()).toList() : null, // Convert expenses to Map
    };
  }

  // Convert a Map from the database into an Item object
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      itemImage: map['item_image'],
      category: map['category_id'],
      variants: map['variants'] != null ? List<Variant>.from(map['variants'].map((v) => Variant.fromMap(v))) : null, // Convert variants back to list of Variant
      expenses: map['expenses'] != null ? List<Expense>.from(map['expenses'].map((e) => Expense.fromMap(e))) : null, // Convert expenses back to list of Expense
    );
  }
}
