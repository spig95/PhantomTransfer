import 'package:flutter/material.dart';
import 'package:phantom_transfer/models/transaction_data.dart';

class ReadyView extends StatelessWidget {
  final TransactionData transaction;

  const ReadyView({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const Icon(
          Icons.credit_card,
          size: 90,
        ),

        const SizedBox(height: 40),

        const Text(
          'Ready to receive payment',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          '${transaction.currency}'
              '${transaction.amount}',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
}