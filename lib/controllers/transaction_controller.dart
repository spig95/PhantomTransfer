import 'package:flutter/foundation.dart';
import 'package:phantom_transfer/services/sound_service.dart';
import 'package:flutter/material.dart';
import 'package:phantom_transfer/models/processing_step.dart';

enum TransactionState {
  ready,
  processing,
  completed,
}

class TransactionController extends ChangeNotifier {
  final SoundService _soundService = SoundService();

  TransactionState _state = TransactionState.ready;

  ProcessingStep _step =
      ProcessingStep.processingPayment;

  TransactionState get state => _state;
  ProcessingStep get step => _step;

  void _setStep(ProcessingStep step) {
    _step = step;
    notifyListeners();
  }

  void _setState(TransactionState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> start() async {
    if (_state != TransactionState.ready) {
      return;
    }

    _soundService.playCardDetectedSound();
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    _setState(TransactionState.processing);

    _setStep(ProcessingStep.processingPayment);
    await Future.delayed(
      const Duration(milliseconds: 2000),
    );

    _setStep(ProcessingStep.contactingBank);
    await Future.delayed(
      const Duration(milliseconds: 2000),
    );

    _setStep(ProcessingStep.verifyingTransaction);
    await Future.delayed(
      const Duration(milliseconds: 2000),
    );

    _soundService.playSuccessSound();
    await Future.delayed(
      const Duration(milliseconds: 100),
    );

    _setState(TransactionState.completed);
  }

  void disposeController() {
    _soundService.dispose();
  }
}