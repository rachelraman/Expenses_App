import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // late String titleInput;
  final tittleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? _selectedDate;

  void _submitData() {
    final enteredTittle = tittleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTittle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTittle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Tittle"),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: tittleController,
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              //onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date Chosen'
                        : DateFormat.yMd().format(_selectedDate!),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text('Chose Date'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text(
                "Add Transection",
              ),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
