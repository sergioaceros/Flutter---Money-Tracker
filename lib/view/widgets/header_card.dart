import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String title;
  final double amount;
  final Widget icon;

  const HeaderCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formattedAmount = amount < 0
        ? '-\$ ${amount.abs().toStringAsFixed(2)}'
        : '\$ ${amount.toStringAsFixed(2)}';

    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(
                    width: 4,
                  ),
                  Text(title, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                formattedAmount,
                style: textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
