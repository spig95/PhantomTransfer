import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phantom_transfer/controllers/transaction_controller.dart';
import 'package:phantom_transfer/models/transaction_data.dart';
import 'package:phantom_transfer/widgets/ready_view.dart';
import 'package:phantom_transfer/widgets/transaction_animation.dart';
import 'package:phantom_transfer/widgets/transaction_result.dart';
import 'package:phantom_transfer/services/volume_button_service.dart';

class TransactionPage extends StatefulWidget {
  final TransactionData transaction;

  const TransactionPage({
    super.key,
    required this.transaction,
  });

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late final TransactionController controller;

  final VolumeButtonService volumeButtonService =
  VolumeButtonService();

  @override
  void initState() {
    super.initState();

    controller = TransactionController();

    controller.addListener(() {
      setState(() {});
    });

    volumeButtonService.startListening(
      onVolumeDown: () {
        if (kDebugMode) {
          print('Volume callback executed in TransactionPage');
        }
        controller.start();
      },
    );
  }

  @override
  void dispose() {
    controller.disposeController();
    controller.dispose();
    volumeButtonService.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (controller.state) {
      case TransactionState.ready:
        return ReadyView(
          transaction: widget.transaction,
        );

      case TransactionState.processing:
        return TransactionAnimation(
          transaction: widget.transaction,
          step: controller.step,
        );

      case TransactionState.completed:
        return TransactionResult(
          transaction: widget.transaction,
        );
    }
  }
}