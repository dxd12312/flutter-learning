import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ///定义星期几
  final String label;
  ///花费金额
  final double spendingAmount;
  ///总金额
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///总金额部分
        Container(
          ///固定高度防止换行
          height: 20,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        ///柱形图
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    border: Border.all(color: Colors.grey, width: 1.0)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        ///日期
        Text(label),
      ],
    );
  }
}
