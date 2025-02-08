import 'package:businessy/blocs/inventory/inventory_event.dart';
import 'package:businessy/blocs/inventory/inventory_state.dart';
import 'package:businessy/database/tables/category.dart';
import 'package:businessy/database/tables/expense.dart';
import 'package:businessy/database/tables/income.dart';
import 'package:businessy/database/tables/item.dart';
import 'package:businessy/database/tables/variant.dart'; // Import VariantTable
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:businessy/models/category.dart';
import 'package:businessy/models/item.dart';
import 'package:businessy/models/variant.dart';
import 'package:businessy/models/expense.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final CategoryTable _categoryTable = CategoryTable();
  final ItemTable _itemTable = ItemTable();
  final ExpenseTable _expenseTable = ExpenseTable();
  final IncomeTable _incomeTable = IncomeTable();
  final VariantTable _variantTable = VariantTable();

  InventoryBloc() : super(InventoryInitialState()) {
    List<Category> categories;

    // Handle LoadCategoriesEvent
    on<LoadCategoriesEvent>((event, emit) async {
      try {
        final categoriesMap = await _categoryTable.getAllCategories();

        for (final category in categoriesMap) {
          Category.fromMap(category);
        }
        categories = categoriesMap.map((category) => Category.fromMap(category)).toList();
        print('CATEGOREIES FROM BLOC: $categories');
        emit(CategoriesLoadedState(categories));
      } catch (e) {
        print(e);
      }
    });

    // Handle AddCategoryEvent
    on<AddCategoryEvent>((event, emit) async {
      try {
        final data = {'name': event.categoryName};
        final success = await _categoryTable.insertCategory(data);
        if (success) {
          emit(CategoryAddedState(event.categoryName));
        }
      } catch (e) {
        print(e);
      }
    });

    // Handle DeleteCategoryEvent
    on<DeleteCategoryEvent>((event, emit) async {
      final success = await _categoryTable.deleteCategory(event.categoryId);
      if (success) {
        emit(CategoryDeletedState(event.categoryId));
      }
    });

    // Handle LoadItemsForCategoryEvent
    on<LoadItemsForCategoryEvent>((event, emit) async {
      final items = await _itemTable.getItemsByCategory(event.categoryId);
      final itemsList = items.map((item) => Item.fromMap(item)).toList();
      emit(ItemsLoadedForCategoryState(itemsList));
    });

    // Handle AddItemEvent
    on<AddItemEvent>((event, emit) async {
      final itemData = event.item.toMap();
      print('*********** ITEM FROM BLOC: $itemData');
      final success = await _itemTable.insertItem(itemData);
      if (success) {
        emit(ItemAddedState(event.item));
      }
    });

    // Handle EditItemEvent
    on<EditItemEvent>((event, emit) async {
      final itemData = event.item.toMap();
      final success = await _itemTable.updateItem(event.item.id!, itemData);
      if (success) {
        emit(ItemEditedState(event.item));
      }
    });

    // Handle DeleteItemEvent
    on<DeleteItemEvent>((event, emit) async {
      final success = await _itemTable.deleteItem(event.itemId);
      if (success) {
        emit(ItemDeletedState(event.itemId));
      }
    });

    // Handle LoadAllItemsEvent
    on<LoadAllItemsEvent>((event, emit) async {
      try {
        final itemsMap = await _itemTable.getAllItems();
        final items = itemsMap.map((item) => Item.fromMap(item)).toList();
        emit(ItemsAllLoadedState(items));
      } catch (e) {
        print(e);
      }
    });


    // Handle AddVariantEvent
    on<AddVariantEvent>((event, emit) async {
      final variantData = event.variant.toMap();
      final success = await _variantTable.insertVariant(variantData);
      if (success) {
        emit(VariantAddedState(event.variant));
      }
    });

    // Handle EditVariantEvent
    on<EditVariantEvent>((event, emit) async {
      final variantData = event.variant.toMap();
      final success =
          await _variantTable.updateVariant(event.variant.id!, variantData);
      if (success) {
        emit(VariantEditedState(event.variant));
      }
    });

    // Handle DeleteVariantEvent
    on<DeleteVariantEvent>((event, emit) async {
      final success = await _variantTable.deleteVariant(event.variantId);
      if (success) {
        emit(VariantDeletedState(event.variantId));
      }
    });

    // Handle RecordSaleEvent
    on<RecordSaleEvent>((event, emit) async {
      final success = await _incomeTable.recordIncome(
        itemId: event.item.id!,
        quantitySold: event.quantity,
        itemPrice: event.variant.price.toInt(),
      );
      if (success) {
        emit(SaleRecordedState(event.item, event.quantity, event.variant));
      }
    });

    // Handle AddItemExpenseEvent
    on<AddItemExpenseEvent>((event, emit) async {
      final expenseData = event.expense.toMap();
      final success = await _expenseTable.insertExpense(expenseData);
      if (success) {
        emit(ItemExpenseAddedState(event.expense));
      }
    });

    // Handle EditItemExpenseEvent
    on<EditItemExpenseEvent>((event, emit) async {
      final expenseData = event.expense.toMap();
      final success =
          await _expenseTable.updateExpense(event.expense.id!, expenseData);
      if (success) {
        emit(ItemExpenseEditedState(event.expense));
      }
    });

    // Handle DeleteItemExpenseEvent
    on<DeleteItemExpenseEvent>((event, emit) async {
      final success = await _expenseTable.deleteExpense(event.expenseId);
      if (success) {
        emit(ItemExpenseDeletedState(event.expenseId));
      }
    });
  }
}
