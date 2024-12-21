import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/common/drawer.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/blocs/insights/insights_bloc.dart';
import 'package:businessy/blocs/insights/insights_event.dart';
import 'package:businessy/blocs/insights/insights_state.dart';
import 'package:businessy/database/tables/income.dart';
import 'package:businessy/database/tables/item.dart';


String logo = 'assets/img/business_assets/SerineCrochetLOGO.png';
String businessName = 'Serine Crochet';

class InsightsPage extends StatelessWidget {
  const InsightsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappbar(title: 'Insights'),
      drawer: CustomDrawer(logo: logo, business_name: businessName, index: 4),
      backgroundColor: whiteColor,
      body: BlocProvider(
        create: (context) => InsightsBloc(
             context.read<IncomeTable>(), // Correctly pass the IncomeTable instance
            context.read<ItemTable>(),   // Correctly pass the ItemTable instance
                )..add(LoadInsights()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: BlocBuilder<InsightsBloc, InsightsState>(
            builder: (context, state) {
              if (state is InsightsInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is InsightsState) {
                return _buildInsightsContent(state);
              } else {
                return const Center(child: Text('Error loading insights'));
        }
      },
    ),
  ),
),
    );
  }

  Widget _buildInsightsContent(InsightsState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Financial Overview',
          style: InsightsTypography.title,
        ),
        const SizedBox(height: 39),
        Expanded(
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: state.weeklySalesData
                      .asMap()
                      .entries
                      .map((e) => FlSpot(e.key.toDouble(), e.value.income))
                      .toList(),
                  isCurved: true,
                  color: mainGreen,
                  barWidth: 3,
                  belowBarData: BarAreaData(show: false),
                ),
                LineChartBarData(
                  spots: state.weeklySalesData
                      .asMap()
                      .entries
                      .map((e) => FlSpot(e.key.toDouble(), e.value.expenses))
                      .toList(),
                  isCurved: true,
                  color: expenseline,
                  barWidth: 3,
                  belowBarData: BarAreaData(show: false),
                ),
              ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 4,
                    getTitlesWidget: (value, _) {
                      int index = value.toInt();
                      if (index % 4 == 0 && index < state.weeklySalesData.length) {
                        return Text(state.weeklySalesData[index].month,
                            style: InsightsTypography.chartLabel);
                      }
                      return const SizedBox.shrink();
                    },
                    reservedSize: 32,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1000,
                    getTitlesWidget: (value, _) {
                      return Text('${(value / 1000).toInt()}k',
                          style: InsightsTypography.chartLabel);
                    },
                    reservedSize: 40,
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: Colors.grey.shade300,
                  strokeWidth: 1,
                ),
                getDrawingVerticalLine: (_) => FlLine(
                  color: Colors.grey.shade300,
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: Colors.black26, width: 1),
                  bottom: BorderSide(color: Colors.black26, width: 1),
                ),
              ),
              minX: 0,
              maxX: state.weeklySalesData.length - 1,
              minY: 0,
              maxY: 3000,
            ),
          ),
        ),
        const SizedBox(height: 34),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegend('Income', mainGreen),
            const SizedBox(width: 10),
            _buildLegend('Expenses', expenseline),
          ],
        ),
        const SizedBox(height: 36),
        const Text(
          'Top Sold Items',
          style: InsightsTypography.title,
        ),
        const SizedBox(height: 10),
        DataTable(
          columns: const [
            DataColumn(label: Text('#', style: InsightsTypography.tableHeader)),
            DataColumn(label: Text('Item', style: InsightsTypography.tableHeader)),
            DataColumn(label: Text('Revenue', style: InsightsTypography.tableHeader)),
          ],
          rows: state.topSoldItems.asMap().entries.map((entry) {
            int index = entry.key + 1;
            TopSoldItem item = entry.value;
            return DataRow(cells: [
              DataCell(Text('$index', style: InsightsTypography.tableRow)),
              DataCell(Text(item.item, style: InsightsTypography.tableRow)),
              DataCell(Text('${item.revenue} DA', style: InsightsTypography.tableRow)),
            ]);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLegend(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(label, style: InsightsTypography.legend),
      ],
    );
  }
}
