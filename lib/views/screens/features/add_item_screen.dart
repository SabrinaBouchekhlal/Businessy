import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/blocs/inventory/inventory_bloc.dart';
import 'package:businessy/blocs/inventory/inventory_event.dart';
import 'package:businessy/blocs/inventory/inventory_state.dart';
import 'package:businessy/models/item.dart';
import 'package:businessy/models/variant.dart';
import 'package:businessy/models/expense.dart';
import 'package:businessy/models/category.dart';

class AddItemScreen extends StatefulWidget {
  final List<Category> categories;
  const AddItemScreen({Key? key, required this.categories}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  // Controllers
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController variantController = TextEditingController();
  final TextEditingController variantPriceController = TextEditingController();
  final TextEditingController variantQuantityController = TextEditingController();
  final TextEditingController expenseNameController = TextEditingController();
  final TextEditingController expenseAmountController = TextEditingController();

  // State variables
  int itemQuantity = 0;
  Category? selectedCategory;
  File? _itemImage;
  final List<Variant> variants = [];
  final List<Expense> expenses = [];

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _itemImage = File(pickedFile.path);
      });
    }
  }

  void addVariant() {
    if (variantController.text.isNotEmpty &&
        variantQuantityController.text.isNotEmpty &&
        variantPriceController.text.isNotEmpty) {
      setState(() {
        variants.add(Variant(
          name: variantController.text,
          quantity: int.parse(variantQuantityController.text),
          price: double.parse(variantPriceController.text),
        ));
        variantController.clear();
        variantQuantityController.clear();
        variantPriceController.clear();
      });
    }
  }

  void addExpense() {
    if (expenseNameController.text.isNotEmpty &&
        expenseAmountController.text.isNotEmpty) {
      setState(() {
        expenses.add(Expense(
          name: expenseNameController.text,
          amount: double.parse(expenseAmountController.text),
          type: 'purchase', // You might want to add a type selector
          itemId: 0, // This will be set after the item is created
        ));
        expenseNameController.clear();
        expenseAmountController.clear();
      });
    }
  }

  void saveItem() {
    if (itemNameController.text.isEmpty ||
        priceController.text.isEmpty ||
        selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    try {
      // Create the item
      final item = Item(
        name: itemNameController.text,
        price: double.parse(priceController.text),
        quantity: itemQuantity,
        itemImage: _itemImage?.path ?? '',
        category: selectedCategory!,
        variants: variants,
        expenses: expenses,
      );
print('ITEM JUST ADDED ------->${item.toMap()}');
      // Add the item using
      context.read<InventoryBloc>().add(AddItemEvent(item: item));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving item: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categories = widget.categories;
    return BlocProvider(
      create: (context) => InventoryBloc()..add(LoadCategoriesEvent()),
      child: BlocListener<InventoryBloc, InventoryState>(
        listener: (context, state) {
          if (state is ItemAddedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added successfully')),
            );
            Navigator.pop(context);
          }
          if (state is CategoriesLoadedState) {
            categories = state.categories.map((category) => category).toList();
            print('Categories loaded in item page--------> $categories');
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: Customappbar(
            title: 'Add Item',
            onDonePressed: saveItem,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildItemNameField(),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: _buildImageSection()),
                    const SizedBox(width: 20),
                    Flexible(
                      child: Column(
                        children: [
                          _buildPriceSection(),
                          const SizedBox(height: 20),
                          _buildQuantitySection(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildCategoryDropdown(),
                const SizedBox(height: 20),
                _buildVariantsSection(),
                const SizedBox(height: 20),
                _buildExpensesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemNameField() {
    return TextField(
      controller: itemNameController,
      decoration: InputDecoration(
        labelText: "Item Name",
        filled: true,
        fillColor: inputBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: inputBorder),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add Item Picture",
          style: InventoryTypography.recordSellingAttributeBlackStyle,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF48CFCB), width: 2),
            image: _itemImage != null
                ? DecorationImage(
              image: FileImage(_itemImage!),
              fit: BoxFit.cover,
            )
                : null,
          ),
          child: _itemImage == null
              ? const Icon(Icons.image, size: 50, color: Colors.grey)
              : null,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _pickImage,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF229799),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("Upload Picture"),
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add Item Price",
          style: InventoryTypography.recordSellingAttributeBlackStyle,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: priceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Price",
            filled: true,
            fillColor: inputBg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: inputBorder),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add Item Quantity",
          style: InventoryTypography.recordSellingAttributeBlackStyle,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: AppStyles.basicCardDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  if (itemQuantity > 0) {
                    setState(() => itemQuantity--);
                  }
                },
                icon: const Icon(Icons.remove),
              ),
              Text(
                itemQuantity.toString(),
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                onPressed: () => setState(() => itemQuantity++),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    List<Category> categories = widget.categories;
    print('category ==========> ${categories}');
    return DropdownButtonFormField<Category>(
      value: selectedCategory,
      hint: const Text('Select Category'),
      onChanged: (Category? newCategory) {
        setState(() {
          selectedCategory = newCategory;
        });
      },
      items: categories.map((Category category) {
        print('category =========> ${category.name}');
        return DropdownMenuItem<Category>(
          value: category,
          child: Text(category.name),
        );
      }).toList(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: inputBorder),
        ),
      ),
    );
  }

  Widget _buildVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Variants",
          style: InventoryTypography.recordSellingAttributeBlackStyle,
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: variants.length,
          itemBuilder: (context, index) {
            final variant = variants[index];
            return ListTile(
              title: Text(variant.name),
              subtitle: Text(
                'Quantity: ${variant.quantity} - Price: \$${variant.price}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    variants.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: variantController,
                decoration: const InputDecoration(
                  labelText: 'Variant Name',
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: variantPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: variantQuantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: addVariant,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpensesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Expenses",
          style: InventoryTypography.recordSellingAttributeBlackStyle,
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            final expense = expenses[index];
            return ListTile(
              title: Text(expense.name),
              subtitle: Text('\$${expense.amount}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    expenses.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: expenseNameController,
                decoration: const InputDecoration(
                  labelText: 'Expense Name',
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: expenseAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: addExpense,
            ),
          ],
        ),
      ],
    );
  }
}