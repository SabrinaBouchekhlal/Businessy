import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();
  @override
  List<Object> get props => [];
}

class UpdateTotalBalanceEvent extends WalletEvent {
  final double newBalance;

  const UpdateTotalBalanceEvent({required this.newBalance});
  @override
  List<Object> get props => [newBalance];
}

class UpdateNetWorthEvent extends WalletEvent {
  final double newNetWorth;

  const UpdateNetWorthEvent({required this.newNetWorth});
  @override
  List<Object> get props => [newNetWorth];
}

class ResetFinancialGoalEvent extends WalletEvent {
  final double newGoal;

  const ResetFinancialGoalEvent({required this.newGoal});
  @override
  List<Object> get props => [newGoal];
}

class UpdateFinancialGoalProgressEvent extends WalletEvent {
  final int newProgress;

  const UpdateFinancialGoalProgressEvent({ required this.newProgress});
  @override
  List<Object> get props => [newProgress];
}

class UpdateChartDataEvent extends WalletEvent {
  final String userId;
  final double newProgress;

  const UpdateChartDataEvent({required this.userId, required this.newProgress});
  @override
  List<Object> get props => [userId, newProgress];
}

class AddGlobalExpenseEvent extends WalletEvent {
  final String expenseName;
  final double expenseAmount;

  const AddGlobalExpenseEvent({required this.expenseName, required this.expenseAmount});
  @override
  List<Object> get props => [expenseName, expenseAmount];
}

class DeleteExpenseEvent extends WalletEvent {
  final String expenseId;

  const DeleteExpenseEvent({required this.expenseId});
  @override
  List<Object> get props => [expenseId];
}

class PayExpenseEvent extends WalletEvent {
  final String expenseId;

  const PayExpenseEvent({required this.expenseId});
  @override
  List<Object> get props => [expenseId];
}

class UndoPaidExpenseEvent extends WalletEvent {
  final String expenseId;

  const UndoPaidExpenseEvent({required this.expenseId});
  @override
  List<Object> get props => [expenseId];
}

class LoadPaymentHistoryEvent extends WalletEvent {

  const LoadPaymentHistoryEvent();
  @override
  List<Object> get props => [];
}
