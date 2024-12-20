import 'package:equatable/equatable.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object?> get props => [];
}

class CurrentBalanceState extends WalletState {
  final double balance;

  const CurrentBalanceState({required this.balance});
  @override
  List<Object?> get props => [balance];
}

class NetWorthState extends WalletState {
  final double netWorth;

  const NetWorthState({required this.netWorth});
  @override
  List<Object?> get props => [netWorth];
}

class GlobalExpensesState extends WalletState {
  final List<Map<String, dynamic>> globalExpenses;

  const GlobalExpensesState({required this.globalExpenses});
  @override
  List<Object?> get props => [globalExpenses];
}

class PaymentHistoryState extends WalletState {
  final List<Map<String, dynamic>> paymentHistory;

  const PaymentHistoryState({required this.paymentHistory});
  @override
  List<Object?> get props => [paymentHistory];
}

class GoalProgressState extends WalletState {
  final double goalProgress;

  const GoalProgressState({required this.goalProgress});
  @override
  List<Object?> get props => [goalProgress];
}

class BalanceChartState extends WalletState {
  final List<Map<String, dynamic>> chartData;

  const BalanceChartState({required this.chartData});
  @override
  List<Object?> get props => [chartData];
}
