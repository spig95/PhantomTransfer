import 'package:flutter/material.dart';
import 'package:phantom_transfer/models/transaction_data.dart';
import 'package:phantom_transfer/pages/transaction_page.dart';

class TransferInputPage extends StatefulWidget {
  const TransferInputPage({super.key});

  @override
  State<TransferInputPage> createState() => _TransferInputPageState();
}

class _TransferInputPageState extends State<TransferInputPage> {
  final TextEditingController nameController =
  TextEditingController(text: 'Tullio Pinter');

  final TextEditingController amountController =
  TextEditingController(text: '25.00');

  String selectedCurrency = '€';

  final List<String> currencies = ['€', '\$', '£'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phantom Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: selectedCurrency,
              decoration: const InputDecoration(
                labelText: 'Currency',
                border: OutlineInputBorder(),
              ),
              items: currencies.map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionPage(
                        transaction: TransactionData(
                          name: nameController.text,
                          amount: amountController.text,
                          currency: selectedCurrency,
                        ),
                      ),
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}