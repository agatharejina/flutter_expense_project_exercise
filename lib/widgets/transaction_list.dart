import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../utils/string_formatter.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({required this.transactions, super.key});

  Widget _renderAmount(double amount) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.green.shade800),
        ));
  }

  Widget _renderTitle(String title, DateTime date) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toCapitalized(),
            style: TextStyle(
              color: Colors.green.shade700,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            DateFormat(DateFormat.YEAR_MONTH_WEEKDAY_DAY).format(date),
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              margin: const EdgeInsets.all(8.0),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: transactions[index].amount > 40
                                    ? Colors.red.shade500
                                    : Colors.green.shade500,
                                width: 6.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      child: Row(
                        children: <Widget>[
                          _renderAmount(transactions[index].amount),
                          _renderTitle(transactions[index].title,
                              transactions[index].date)
                        ],
                      ),
                    )),
              ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
