import 'package:businessy/database/tables/income.dart';
import 'package:businessy/database/tables/expense.dart';
import 'package:businessy/database/tables/history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'wallet_event.dart';
import 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final IncomeTable incomeTable;
  final ExpenseTable expenseTable;
  final HistoryTable historyTable;

  WalletBloc({
    required this.incomeTable,
    required this.expenseTable,
    required this.historyTable,
  }) : super(WalletInitialState()) {
    on<UpdateTotalBalanceEvent>((event, emit) async {
      emit(CurrentBalanceState(balance: event.newBalance));
    });

    on<UpdateNetWorthEvent>((event, emit) async {
      emit(NetWorthState(netWorth: event.newNetWorth));
    });

    on<ResetFinancialGoalEvent>((event, emit) async {
      emit(GoalProgressState(goalProgress: 0));
    });

    on<UpdateFinancialGoalProgressEvent>((event, emit) async {
      emit(GoalProgressState(goalProgress: event.newProgress));
    });

    on<UpdateChartDataEvent>((event, emit) async {
    });

    on<AddGlobalExpenseEvent>((event, emit) async {
      final result = await expenseTable.insertExpense({
        'name': event.expenseName,
        'amount': event.expenseAmount,
        'type': 'global',
        'item_id': null,
      });
      if (result) {
        final globalExpenses = await expenseTable.getGlobalExpenses();
        emit(GlobalExpensesState(globalExpenses: globalExpenses));
      }
    });

    on<DeleteExpenseEvent>((event, emit) async {
      final result = await expenseTable.deleteExpense(int.parse(event.expenseId));
      if (result) {
        final globalExpenses = await expenseTable.getGlobalExpenses();
        emit(GlobalExpensesState(globalExpenses: globalExpenses));
      }
    });

    on<PayExpenseEvent>((event, emit) async {
      await historyTable.insertRecord({
        'expense_id': int.parse(event.expenseId),
        'date': DateTime.now().toString(),
      });
      emit(PaymentHistoryState(
        paymentHistory: await historyTable.getRecords(),
      ));
    });

    on<UndoPaidExpenseEvent>((event, emit) async {
      await historyTable.deleteRecord(int.parse(event.expenseId));
      emit(PaymentHistoryState(
        paymentHistory: await historyTable.getRecords(),
      ));
    });

    on<LoadPaymentHistoryEvent>((event, emit) async {
      final paymentHistory = await historyTable.getRecords();
      emit(PaymentHistoryState(paymentHistory: paymentHistory));
    });
  }
}
