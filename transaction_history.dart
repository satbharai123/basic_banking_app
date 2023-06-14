import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final double amount;
  final DateTime date;

  Transaction({required this.title, required this.amount, required this.date});
}

class TransactionHistoryScreen extends StatelessWidget {
  final List<Transaction> transactionList = [
    Transaction(title: 'Payment received', amount: 100.0, date: DateTime.now()),
    Transaction(title: 'Payment sent', amount: -50.0, date: DateTime.now()),
    Transaction(title: 'Online purchase', amount: -25.0, date: DateTime.now()),
    Transaction(title: 'Payment received', amount: 75.0, date: DateTime.now()),
    Transaction(title: 'Payment sent', amount: -30.0, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          Transaction transaction = transactionList[index];
          return ListTile(
            title: Text(transaction.title),
            subtitle: Text(transaction.date.toString()),
            trailing: Text(transaction.amount.toString()),
          );
        },
      ),
    );
  }
}
