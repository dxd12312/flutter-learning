import 'package:flutter/material.dart';
import 'package:flutter_complete_guid/models/transaction.dart';
import 'package:flutter_complete_guid/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  ///底部日期时间
  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  ///日期倒序
  // List<Map<String, Object>> get groupedTransactionsValues {
  //   return List.generate(7, (index) {
  //     final weekDay = DateTime.now().subtract(Duration(days: index));
  //
  //     double totalSum = 0.0;
  //     for (var i = 0; i < recentTransactions.length; i++) {
  //       if (recentTransactions[i].date.day == weekDay.day &&
  //           recentTransactions[i].date.month == weekDay.month &&
  //           recentTransactions[i].date.year == weekDay.year) {
  //         totalSum += recentTransactions[i].amount;
  //       }
  //     }
  //     return {
  //       'day': DateFormat.E().format(weekDay).substring(0, 1),
  //       'amount': totalSum,
  //     };
  //   }).reversed.toList();
  // }

  ///计算总的花费金额
  double get totalSpending {
    return groupedTransactionsValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'] as String, data['amount'] as double,
                  (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
