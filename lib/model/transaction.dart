class Transaction {
  final TransactionType type;
  final String description;
  final double amount;

  Transaction({
    required this.type,
    required this.description,
    required this.amount,
  });
}

enum TransactionType {
  income,
  expense,
}
