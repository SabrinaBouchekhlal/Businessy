import 'package:equatable/equatable.dart';


abstract class WalletEvent extends Equatable{
  const WalletEvent();
  @override
  List<Object> get props => [];
}

//when anything triggers an update of balance (ex: paying/undo paying an expenses, selling a new product, etc..)
class UpdateTotalBalanceEvent extends WalletEvent{
  final String user_id;
  final double new_balance;

  const UpdateTotalBalanceEvent({required this.user_id, required this.new_balance});
  @override
  List<Object> get props => [user_id, new_balance];
}

//not sure if i should keep it or merge it with the previous one???
class UpdateNetWorthEvent extends WalletEvent{
  final String user_id;
  final double new_balance;

  const UpdateNetWorthEvent({required this.user_id, required this.new_balance});
  @override
  List<Object> get props => [user_id, new_balance];
}

//when clicking on 'reset new goal' button
class ResetFinancialGoalEvent extends WalletEvent{
  final String user_id;
  final double new_goal;

  const ResetFinancialGoalEvent({required this.user_id, required this.new_goal});
  @override
  List<Object> get props => [user_id, new_goal];
}

//when a rise in the income occurs
class UpdateFinancialGoalProgressEvent extends WalletEvent{
  final String user_id;
  final double new_progress;

  const UpdateFinancialGoalProgressEvent({required this.user_id, required this.new_progress});
  @override
  List<Object> get props => [user_id, new_progress];
}

//when a rise in the income occurs
//IF WE STORE THE CURRENT BALANCE IN THE DB THEN NO NEED TO ADD THE NEW PROGRESS
class UpdateChartDataEvent extends WalletEvent{
  final String user_id;
  final double new_progress;

  const UpdateChartDataEvent({required this.user_id, required this.new_progress});
  @override
  List<Object> get props => [user_id, new_progress];
}

//when the users add a new global expense to additional expenses table
class AddGlobalExpenseEvent extends WalletEvent{
  final String user_id;
  final String expense_name;
  final double expense_amount;

  const AddGlobalExpenseEvent ({required this.user_id, required this.expense_name, required this.expense_amount});
  @override
  List<Object> get props => [user_id, expense_name, expense_amount];
}

//when the users delete a global expense to additional expenses table
class DeleteExpenseEvent extends WalletEvent{
  final String expense_id;

  const DeleteExpenseEvent ({required this.expense_id});
  @override
  List<Object> get props => [expense_id];
}

//when the user pay a global expense
class PayExpenseEvent extends WalletEvent{
  final String expense_id;

  const PayExpenseEvent ({required this.expense_id});
  @override
  List<Object> get props => [expense_id];
}

//when the user undo paying a global expense
class UndoPaidExpenseEvent extends WalletEvent{
  final String expense_id;

  const UndoPaidExpenseEvent ({required this.expense_id});
  @override
  List<Object> get props => [expense_id];
}

//when the user pay a global expense
class LoadPaymentHistoryEvent extends WalletEvent{
  final String history_id;

  const LoadPaymentHistoryEvent ({required this.history_id});
  @override
  List<Object> get props => [history_id];
}


