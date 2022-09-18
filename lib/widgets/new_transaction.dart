import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final Function onPressAddNewTrx;

  NewTransaction({required this.onPressAddNewTrx, super.key});

  void _onPressAddTrxBtn() {
    onPressAddNewTrx(
        _titleController.text, double.parse(_amountController.text));
  }

  Widget _renderInput(String inputType) {
    String labelText = inputType == 'amount' ? 'Amount' : 'Title';
    String hintText = inputType == 'amount' ? 'Input Amount' : 'Input Title';
    TextEditingController controller =
        inputType == 'amount' ? _amountController : _titleController;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
            )));
  }

  Widget _renderInputBtn(VoidCallback onPressed) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          'Add New Transaction',
          style: TextStyle(color: Colors.purple.shade600),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _renderInput('title'),
          _renderInput('amount'),
          _renderInputBtn(_onPressAddTrxBtn)
        ],
      ),
    );
  }
}
