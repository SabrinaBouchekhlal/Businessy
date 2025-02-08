import 'package:businessy/models/category.dart';
import 'package:businessy/models/expense.dart';
import 'package:businessy/models/item.dart';
import 'package:businessy/models/variant.dart';
import 'package:equatable/equatable.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();
  @override
  List<Object> get props => [];
}

class LoadCategoriesEvent extends InventoryEvent {}
class LoadItemsEvent extends InventoryEvent {}

class AddCategoryEvent extends InventoryEvent {
  final String categoryName;

  AddCategoryEvent({required this.categoryName});
  @override
  List<Object> get props => [categoryName];
}

class DeleteCategoryEvent extends InventoryEvent {
  final int categoryId;

  const DeleteCategoryEvent({required this.categoryId});
  @override
  List<Object> get props => [categoryId];
}

class LoadAllItemsEvent extends InventoryEvent {

  const LoadAllItemsEvent();
  @override
  List<Object> get props => [];
}

class LoadItemsForCategoryEvent extends InventoryEvent {
  final int categoryId;

  const LoadItemsForCategoryEvent({required this.categoryId});
  @override
  List<Object> get props => [categoryId];
}

class AddItemEvent extends InventoryEvent {
  final Item item;

  const AddItemEvent({required this.item});
  @override
  List<Object> get props => [item];
}

class EditItemEvent extends InventoryEvent {
  final Item item;

  const EditItemEvent({required this.item});
  @override
  List<Object> get props => [item];
}

class DeleteItemEvent extends InventoryEvent {
  final int itemId;

  const DeleteItemEvent({required this.itemId});
  @override
  List<Object> get props => [itemId];
}

class RecordSaleEvent extends InventoryEvent {
  final Item item;
  final int quantity;
  final Variant variant;

  const RecordSaleEvent({required this.item, required this.variant, required this.quantity});
  @override
  List<Object> get props => [item, variant, quantity];
}

class AddVariantEvent extends InventoryEvent {
  final Variant variant;

  const AddVariantEvent({required this.variant});
  @override
  List<Object> get props => [variant];
}

class EditVariantEvent extends InventoryEvent {
  final Variant variant;

  const EditVariantEvent({required this.variant});
  @override
  List<Object> get props => [variant];
}

class DeleteVariantEvent extends InventoryEvent {
  final int variantId;

  const DeleteVariantEvent({required this.variantId});
  @override
  List<Object> get props => [variantId];
}

class AddItemExpenseEvent extends InventoryEvent {
  final Expense expense;

  const AddItemExpenseEvent({required this.expense});
  @override
  List<Object> get props => [expense];
}

class EditItemExpenseEvent extends InventoryEvent {
  final Expense expense;

  const EditItemExpenseEvent({required this.expense});
  @override
  List<Object> get props => [expense];
}

class DeleteItemExpenseEvent extends InventoryEvent {
  final int expenseId;

  const DeleteItemExpenseEvent({required this.expenseId});
  @override
  List<Object> get props => [expenseId];
}