import 'package:flutter/material.dart';
import 'package:myapp/model/transaction.dart';

class TransactionsProvider extends ChangeNotifier {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3049481826.
  final List<Transaction> _transactions = [
    Transaction(
      type: TransactionType.income,
      description: 'Salary',
      amount: 1000.0,
    ),
    Transaction(
      type: TransactionType.expense,
      description: 'Rent',
      amount: -500.0,
    ),
  ];

  List<Transaction> get transactions => _transactions;

  double getTotalIncomes() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getTotalExpenses() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getBalance() {
    return getTotalIncomes() + getTotalExpenses();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
