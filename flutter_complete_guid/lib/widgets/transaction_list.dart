import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(transactions[index].title),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
            ),
          );
            // Card(
            // child: Row(
            //   children: [
            //     Container(
            //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //       decoration: BoxDecoration(
            //           border: Border.all(color: Colors.red, width: 2)),
            //       padding: EdgeInsets.all(10),
            //       child: Text(
            //         '\$${transactions[index].amount}',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: Colors.red,
            //         ),
            //       ),
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           transactions[index].title,
            //           style:
            //               TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //         ),
            //         Text(
            //           DateFormat.yMMMd().format(transactions[index].date),
            //           style: TextStyle(color: Colors.grey),
            //         ),
            //       ],
            //     )
            //   ],
            // ),
        },
        itemCount: transactions.length,
      ),
    );
  }
}
