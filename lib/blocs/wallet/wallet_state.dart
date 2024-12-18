import 'package:equatable/equatable.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object?> get props => [];
}

class CurrentBalanceState extends WalletState{
  @override
  List<Object?> get props => [];
}

//might remove it later on
class NetWorthState extends WalletState{
  @override
  List<Object?> get props => [];
}

class GlobalExpensesState extends WalletState{
  @override
  List<Object?> get props => [];
}

class PayementHistoryState extends WalletState{
  @override
  List<Object?> get props => [];
}

class GoalProgressState extends WalletState{
  @override
  List<Object?> get props => [];
}

class BalanceChartState extends WalletState{
  @override
  List<Object?> get props => [];
}