

import 'package:businessy/models/category.dart';
import 'package:businessy/models/item.dart';
import 'package:businessy/models/variant.dart';
import 'package:businessy/models/expense.dart';
import 'package:equatable/equatable.dart';

abstract class InventoryState extends Equatable {
  const InventoryState();
  @override
  List<Object> get props => [];
}

class InventoryInitialState extends InventoryState {}

class CategoriesLoadedState extends InventoryState {
  final List<Category> categories;

  const CategoriesLoadedState(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryAddedState extends InventoryState {
  final Category category;

  const CategoryAddedState(this.category);

  @override
  List<Object> get props => [category];
}

class CategoryDeletedState extends InventoryState {
  final int categoryId;

  const CategoryDeletedState(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class ItemsLoadedForCategoryState extends InventoryState {
  final List<Item> items;

  const ItemsLoadedForCategoryState(this.items);

  @override
  List<Object> get props => [items];
}

class ItemAddedState extends InventoryState {
  final Item item;

  const ItemAddedState(this.item);

  @override
  List<Object> get props => [item];
}

class ItemEditedState extends InventoryState {
  final Item item;

  const ItemEditedState(this.item);

  @override
  List<Object> get props => [item];
}

class ItemDeletedState extends InventoryState {
  final int itemId;

  const ItemDeletedState(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class SaleRecordedState extends InventoryState {
  final Item item;
  final int quantity;
  final Variant variant;

  const SaleRecordedState(this.item, this.quantity, this.variant);

  @override
  List<Object> get props => [item, quantity, variant];
}

class VariantAddedState extends InventoryState {
  final Variant variant;

  const VariantAddedState(this.variant);

  @override
  List<Object> get props => [variant];
}

class VariantEditedState extends InventoryState {
  final Variant variant;

  const VariantEditedState(this.variant);

  @override
  List<Object> get props => [variant];
}

class VariantDeletedState extends InventoryState {
  final int variantId;

  const VariantDeletedState(this.variantId);

  @override
  List<Object> get props => [variantId];
}

class ItemExpenseAddedState extends InventoryState {
  final Expense expense;

  const ItemExpenseAddedState(this.expense);

  @override
  List<Object> get props => [expense];
}

class ItemExpenseEditedState extends InventoryState {
  final Expense expense;

  const ItemExpenseEditedState(this.expense);

  @override
  List<Object> get props => [expense];
}

class ItemExpenseDeletedState extends InventoryState {
  final int expenseId;

  const ItemExpenseDeletedState(this.expenseId);

  @override
  List<Object> get props => [expenseId];
}
