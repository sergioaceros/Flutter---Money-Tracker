import 'package:flutter/material.dart';
import 'package:myapp/view/components/add_transaction_dialog.dart';
import 'package:myapp/view/components/home_header.dart';
import 'package:myapp/view/components/transactions_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            homeHeader(),
            TransactionsList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mostrar un Bottom sheet para agregar transaccion
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const AddTransactionDialog();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
