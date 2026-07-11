import 'package:flutter/material.dart';
import 'package:phantom_transfer/pages/transfer_input_page.dart';

void main() {
  runApp(const PhantomTransferApp());
}

class PhantomTransferApp extends StatelessWidget {
  const PhantomTransferApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phantom Transfer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TransferInputPage(),
    );
  }
}
