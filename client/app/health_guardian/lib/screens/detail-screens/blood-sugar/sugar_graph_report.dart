import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_guardian/styling/colors.dart';

class CustomLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 55,right: 20,left: 10),
        child: Center(
          child: LineChart(
            LineChartData(
              backgroundColor: Colors.white,
              minX: 16,
              maxX: 22,
              minY: 40,
              maxY: 140,
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 35,
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 59, 56, 56),
                            fontFamily: "CoreSansBold",
                            fontSize: 16),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 45,
                    showTitles: true,
                    interval: 20,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 59, 56, 56),
                            fontFamily: "CoreSansBold",
                            fontSize: 16),
                      );
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Hide top titles
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Hide right titles
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(16, 120),
                    FlSpot(17, 110),
                    FlSpot(18, 130),
                    FlSpot(19, 115),
                    FlSpot(20, 125),
                    FlSpot(21, 105),
                    FlSpot(22, 140),
                  ],
                  isCurved: false,
                  color: Colours.buttonColorRed,
                  barWidth: 3.5,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.red.withOpacity(0.2),
                  ),
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) =>
                        FlDotCirclePainter(
                      radius: 6.5,
                      color: Colors.white,
                      strokeWidth: 3,
                      strokeColor: Colours.buttonColorRed,
                    ),
                  ),
                ),
              ],
              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) {
                    return Color.fromARGB(255, 11, 10, 10);
                  },
        
                  tooltipRoundedRadius: 30, // Rounded radius to make it circular
                  tooltipPadding: const EdgeInsets.all(
                      8), // Adjust padding to make it more circular
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        spot.y.toInt().toString(),
                        const TextStyle(
                          color: Colours.buttonColorRed,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
