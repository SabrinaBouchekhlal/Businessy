import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:businessy/views/screens/features/paymentsHistoryPage.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/common/drawer.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:businessy/views/widgets/wallet%20components/balanceBox.dart';
import 'package:businessy/views/widgets/wallet%20components/balanceStatus.dart';
import 'package:businessy/views/widgets/wallet%20components/customTable.dart';
import '../../../blocs/wallet/wallet_bloc.dart';
import '../../../blocs/wallet/wallet_event.dart';
import '../../../blocs/wallet/wallet_state.dart';
import '../../../database/tables/expense.dart';
import '../../../database/tables/history.dart';
import '../../../database/tables/income.dart';
import '../../widgets/wallet%20components/goalProgressBar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    String businessName = 'Serine Crochet';
    String logo = 'assets/img/business_assets/SerineCrochetLOGO.png';

    return Scaffold(
      appBar: const Customappbar(title: 'Wallet'),
      drawer: CustomDrawer(logo: logo, business_name: businessName, index: 2),
      backgroundColor: whiteColor,
      body: BlocProvider(
        create: (context) => WalletBloc(
          incomeTable: IncomeTable(),
          expenseTable: ExpenseTable(),
          historyTable: HistoryTable(),
        )..add(LoadPaymentHistoryEvent()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<WalletBloc, WalletState>(
                builder: (context, state) {
                  double income = 0.0;
                  double expenses = 0.0;
                  if (state is CurrentBalanceState) {
                    income = state.balance;
                  }
                  return BalanceBox(income: income, expenses: expenses);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 50, width: 50),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentHistoryPage()),
                            );
                          },
                          child: const Text(
                            'See history of payments',
                            style: BalanceBoxTypography.paymentHistory,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text('Goal Progress', style: ProgressBarTypography.title),
                              BlocBuilder<WalletBloc, WalletState>(
                                builder: (context, state) {
                                  int progress = 0;
                                  if (state is GoalProgressState) {
                                    progress = state.goalProgress;
                                  }
                                  return GoalProgressBar(progressPercentage: progress);
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text('Current Balance', style: ProgressBarTypography.title),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BlocBuilder<WalletBloc, WalletState>(
                                  builder: (context, state) {
                                    double balance = 0.0;
                                    if (state is CurrentBalanceState) {
                                      balance = state.balance;
                                    }
                                    return Balancestatus(value: balance);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<WalletBloc, WalletState>(
                      builder: (context, state) {
                        List<Map> entries = [];
                        if (state is GlobalExpensesState) {
                          entries = state.globalExpenses;
                        }
                        return CustomTable(
                          title: "Additional Expenses",
                          entries: entries,
                          fieldController1: TextEditingController(),
                          fieldController2: TextEditingController(),
                          addEntry: () {
                            final bloc = BlocProvider.of<WalletBloc>(context);
                            bloc.add(AddGlobalExpenseEvent(
                              expenseName: 'New Expense',
                              expenseAmount: 500.00,
                            ));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
