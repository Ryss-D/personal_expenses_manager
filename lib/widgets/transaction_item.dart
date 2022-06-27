import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
    // this super(key:key) allowus to intanciate the parent class and pass data to it, in this case a key
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('dd-MM-yyyy H:mm').format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                //set color
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
    // return Card(
    //   child: Row(
    //     children: [
    //       Container(
    //         margin: EdgeInsets.symmetric(
    //           vertical: 10,
    //           horizontal: 15,
    //         ),
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: Theme.of(context).primaryColor,
    //             width: 2,
    //           ),
    //         ),
    //         padding: EdgeInsets.all(10),
    //         child: Text(
    //           '\$${transaction.amount.toStringAsFixed(2)}',
    //           style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 20,
    //               color: Theme.of(context).primaryColor),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Text(
    //             transaction.title,
    //             style: Theme.of(context).textTheme.headline6,
    //           ),
    //           Text(
    //             DateFormat('dd-MM-yyyy H:mm')
    //                 .format(transaction.date),
    //             style: TextStyle(
    //               color: Colors.grey,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
    //the following is a replacement to code above:
  }
}
