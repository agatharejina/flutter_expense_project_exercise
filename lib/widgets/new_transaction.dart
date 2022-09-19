import 'package:flutter/material.dart';

// widget class
class NewTransaction extends StatefulWidget {
  final Function onPressAddNewTrx;

  const NewTransaction({required this.onPressAddNewTrx, super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

// state class
class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _onPressAddTrxBtn() {
    final inputTitle = _titleController.text;
    final inputAmount = double.parse(_amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0) return;

    // widget connects widget class and state class
    widget.onPressAddNewTrx(inputTitle, inputAmount);

    // close the top most screen. in this case, it's the modal bottom sheet
    Navigator.of(context).pop();
  }

  Widget _renderInput(String inputType) {
    String labelText = inputType == 'amount' ? 'Amount' : 'Title';
    String hintText = inputType == 'amount' ? 'Input Amount' : 'Input Title';
    TextEditingController controller =
        inputType == 'amount' ? _amountController : _titleController;
    TextInputType keyboardType = inputType == 'amount'
        ? const TextInputType.numberWithOptions(decimal: true)
        : TextInputType.text;

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: ((_) => _onPressAddTrxBtn()),
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
            )));
  }

  Widget _renderInputBtn(VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              backgroundColor: const Color.fromRGBO(214, 239, 222, 1.0)),
          child: const Text(
            'Add New Transaction',
            style: TextStyle(color: Color(0xff1D3A53)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            _renderInput('title'),
            _renderInput('amount'),
            _renderInputBtn(_onPressAddTrxBtn)
          ],
        ),
      ),
    );
  }
}
