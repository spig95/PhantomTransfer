import 'package:flutter/material.dart';
import 'package:phantom_transfer/models/transaction_data.dart';

class TransactionResult extends StatefulWidget {
  final TransactionData transaction;

  const TransactionResult({
    super.key,
    required this.transaction,
  });

  @override
  State<TransactionResult> createState() =>
      _TransactionResultState();
}

class _TransactionResultState extends State<TransactionResult>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Icon(
            Icons.check_circle,
            size: 100,
          ),

          const SizedBox(height: 10),

          const Text(
            'payment completed',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 80),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              widget.transaction.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'sent you',
            style: TextStyle(
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            '${widget.transaction.currency}'
                '${widget.transaction.amount}',
            style: const TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}