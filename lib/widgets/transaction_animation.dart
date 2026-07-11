import 'package:flutter/material.dart';
import 'package:phantom_transfer/models/processing_step.dart';
import 'package:phantom_transfer/models/transaction_data.dart';

class TransactionAnimation extends StatefulWidget {
  final TransactionData transaction;
  final ProcessingStep step;

  const TransactionAnimation({
    super.key,
    required this.transaction,
    required this.step,
  });

  @override
  State<TransactionAnimation> createState() =>
      _TransactionAnimationState();
}

class _TransactionAnimationState extends State<TransactionAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String get message {
    switch (widget.step) {
      case ProcessingStep.processingPayment:
        return 'Processing payment...';

      case ProcessingStep.contactingBank:
        return 'Contacting bank...';

      case ProcessingStep.verifyingTransaction:
        return 'Verifying transaction...';
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${widget.transaction.currency}'
              '${widget.transaction.amount}',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 40),

        RotationTransition(
          turns: _controller,
          child: const Icon(
            Icons.sync,
            size: 70,
          ),
        ),

        const SizedBox(height: 40),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            message,
            key: ValueKey(widget.step),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}