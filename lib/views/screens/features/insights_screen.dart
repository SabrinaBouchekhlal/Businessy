import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/common/drawer.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:fl_chart/fl_chart.dart';

String logo = 'assets/img/business_assets/SerineCrochetLOGO.png';
String businessName = 'Serine Crochet';

class InsightsPage extends StatelessWidget {
  final List<SalesData> weeklySalesData = [
    SalesData(week: 1, month: 'Jan', income: 1000, expenses: 1200),
    SalesData(week: 2, month: 'Jan', income: 1500, expenses: 1800),
    SalesData(week: 3, month: 'Jan', income: 1200, expenses: 1000),
    SalesData(week: 4, month: 'Jan', income: 1300, expenses: 1100),
    SalesData(week: 1, month: 'Feb', income: 1400, expenses: 1500),
    SalesData(week: 2, month: 'Feb', income: 1600, expenses: 2000),
    SalesData(week: 3, month: 'Feb', income: 1800, expenses: 1200),
    SalesData(week: 4, month: 'Feb', income: 1200, expenses: 900),
    SalesData(week: 1, month: 'Mar', income: 2200, expenses: 2100),
    SalesData(week: 2, month: 'Mar', income: 2000, expenses: 2500),
    SalesData(week: 3, month: 'Mar', income: 2400, expenses: 2300),
    SalesData(week: 4, month: 'Mar', income: 1800, expenses: 1900),
    SalesData(week: 1, month: 'Apr', income: 2600, expenses: 2700),
    SalesData(week: 2, month: 'Apr', income: 2800, expenses: 3000),
    SalesData(week: 3, month: 'Apr', income: 2200, expenses: 2400),
    SalesData(week: 4, month: 'Apr', income: 2500, expenses: 2000),
  ];

  final List<TopSoldItem> topSoldItems = [
    TopSoldItem(item: 'Handbag', revenue: 12000),
    TopSoldItem(item: 'Turtle Plush', revenue: 9000),
    TopSoldItem(item: 'Sweater', revenue: 7500),
    TopSoldItem(item: 'Backpack', revenue: 3000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappbar(title: 'Insights'),
      drawer: CustomDrawer(logo: logo, business_name: businessName,index:4),
      backgroundColor:whiteColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
          child: Column(
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
                        spots: weeklySalesData
                            .asMap()
                            .entries
                            .map((e) =>
                                FlSpot(e.key.toDouble(), e.value.income))
                            .toList(),
                        isCurved: true,
                        color: mainGreen,
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: weeklySalesData
                            .asMap()
                            .entries
                            .map((e) =>
                                FlSpot(e.key.toDouble(), e.value.expenses))
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
                            if (index % 4 == 0 && index < weeklySalesData.length) {
                              return Text(weeklySalesData[index].month,style: InsightsTypography.chartLabel);
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
                            return Text('${(value / 1000).toInt()}k',style: InsightsTypography.chartLabel);
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
                    maxX: weeklySalesData.length - 1,
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
                rows: topSoldItems.asMap().entries.map((entry) {
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
          ),
        ),

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
        Text(label ,
        style: InsightsTypography.legend),
      ],
    );
  }
}

class SalesData {
  final int week;
  final String month;
  final double income;
  final double expenses;

  SalesData({
    required this.week,
    required this.month,
    required this.income,
    required this.expenses,
  });
}

class TopSoldItem {
  final String item;
  final int revenue;

  TopSoldItem({required this.item, required this.revenue});
}


