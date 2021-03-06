import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widgets/adaptive_elevated_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  late DateTime _selectedDate;

  @override
  void initState() {
    // by default init state is called on State (the parent) but we can make our own initizalizacion too
    // TODO: implement initState
    //super keyword refers to methods and properties on parent
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    //give us the information about old widget, ieg we can compare the new and the old widgets
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //its automatically called wihen a widget is destroyed but we can implemen by our own too
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0 || _selectedDate == null) {
      return;
    }
    //widget. allow us to acces to atributes and methods from widget class
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
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
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            // this allowus to respect the space of widget with the keyboard and dont overlaping it with the keyboard
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // CupertinoTextField(
              // placeholder: 'Title',
              // ),
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                //onChanged: (value) {
                //titleInput = value;
                //},
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                //onChanged: (value) {
                //amountInput = value;
                //},
                controller: _amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date choosen'
                          : 'Picked date: ${DateFormat('dd-MM-yyyy H:mm').format(_selectedDate)}'),
                    ),
                    TextButton(
                      //style: color text purple,
                      child: const Text(
                        'Choose date',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    )
                  ],
                ),
              ),
              AdaptiveElevatedButton(
                text: "Add transaction",
                submitFunction: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
