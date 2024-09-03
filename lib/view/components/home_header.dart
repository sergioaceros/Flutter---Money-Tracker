import 'package:flutter/material.dart';
import 'package:myapp/controller/transactions_provider.dart';
import 'package:myapp/view/widgets/header_card.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class homeHeader extends StatelessWidget {
  const homeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<TransactionsProvider>(context);
    final balance = provider.getBalance();
    final incomes = provider.getTotalIncomes();
    final expenses = provider.getTotalExpenses();

    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(
              'MONEY TRACKER',
              style: textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.teal.shade900),
            ),
            const SizedBox(height: 12),
            Text(
              'Balance:',
              style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5)),
            ),
            Text(
              '\$ ${balance.toStringAsFixed(2)}',
              style: textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  HeaderCard(
                    title: 'Incomes',
                    amount: incomes,
                    icon: const Icon(Icons.arrow_upward, color: Colors.green),
                  ),
                  const SizedBox(width: 12),
                  HeaderCard(
                    title: 'Expenses',
                    amount: expenses,
                    icon: const Icon(Icons.arrow_downward, color: Colors.red),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
