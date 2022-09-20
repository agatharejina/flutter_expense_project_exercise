import 'package:flutter/material.dart';
import 'package:flutter_expense_project/widgets/transaction_list.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Inter',
        textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(
                fontFamily: 'SourceSansPro', fontWeight: FontWeight.bold),
            titleSmall:
                const TextStyle(fontFamily: 'SourceSansPro', fontSize: 12)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(onPressAddNewTrx: _addNewTransaction),
          );
        });
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text('Expense App'),
      // backgroundColor: const Color(0xff1D3A53),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add))
      ],
    );
  }

  Widget _appBody() {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.infinity,
              child: const Card(
                color: (Color.fromRGBO(214, 239, 222, 1.0)),
                elevation: 3,
                child: Text(
                  'Chart',
                  style: TextStyle(color: Color(0xff1D3A53)),
                ),
              )),
          TransactionList(transactions: _userTransaction)
        ],
      ),
    );
  }

  Widget _renderFloatingActionBtn() {
    return FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _appBody(),
      floatingActionButton: _renderFloatingActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
