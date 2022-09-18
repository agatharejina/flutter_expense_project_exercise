import 'package:flutter/material.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(id: 1, title: 'fashion', amount: 69.25, date: DateTime.now()),
    Transaction(id: 2, title: 'FnB', amount: 39.15, date: DateTime.now()),
    Transaction(id: 3, title: 'Makeup', amount: 29.15, date: DateTime.now()),
    Transaction(id: 4, title: 'Skincare', amount: 51.15, date: DateTime.now()),
    Transaction(id: 5, title: 'Gadget', amount: 210, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTrx = Transaction(
        id: _userTransaction.length + 1,
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTrx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(onPressAddNewTrx: _addNewTransaction),
        TransactionList(transactions: _userTransaction)
      ],
    );
  }
}
