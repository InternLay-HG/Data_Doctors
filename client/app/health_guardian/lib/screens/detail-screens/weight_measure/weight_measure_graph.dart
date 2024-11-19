import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

class CustomBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 3.16*SizeConfig.heightMultiplier, right: 4.46*SizeConfig.widthMultiplier, left: 4.46*SizeConfig.widthMultiplier),
        child: Center(
          child: BarChart(
            BarChartData(
              maxY: 140,
              barGroups: [
                BarChartGroupData(x: 16, barRods: [barRod(80)]),
                BarChartGroupData(x: 17, barRods: [barRod(60)]),
                BarChartGroupData(x: 18, barRods: [barRod(90)]),
                BarChartGroupData(x: 19, barRods: [barRod(100)]),
                BarChartGroupData(
                  x: 20,
                  barRods: [barRod(76)],
                ),
                BarChartGroupData(x: 21, barRods: [barRod(120, isHighlighted: true)]),
                BarChartGroupData(x: 22, barRods: [barRod(100)]),
              ],
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 3.68*SizeConfig.heightMultiplier,
                    interval: 20,
                    getTitlesWidget: (value, meta) => Text(
                      value.toInt().toString(),
                      style: TextStyle(
                          color: const Color.fromARGB(255, 59, 56, 56),
                          fontFamily: "CoreSansBold",
                          fontSize: 1.68*SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 3.16*SizeConfig.heightMultiplier,
                    showTitles: true,
                    getTitlesWidget: (value, meta) => Text(
                      value.toInt().toString(),
                      style: TextStyle(
                          color: const Color.fromARGB(255, 59, 56, 56),
                          fontFamily: "CoreSansBold",
                          fontSize: 1.68*SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Hide top titles
                ),
                rightTitles: AxisTitles(
                  sideTitles:
                      SideTitles(showTitles: false), // Hide right titles
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (group) {
                    return Colors.red;
                  },
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      rod.toY.toString(),
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BarChartRodData barRod(double y, {bool isHighlighted = false}) {
    return BarChartRodData(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(1.89*SizeConfig.heightMultiplier),
        topRight: Radius.circular(1.89*SizeConfig.heightMultiplier),
      ),
      toY: y,
      color: isHighlighted ? Colors.red : Colors.red.withOpacity(0.5),
      width: 7.81*SizeConfig.widthMultiplier,
    );
  }
}
