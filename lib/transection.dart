import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({             // constructor
    required this.id,       // we must use required keyword here beacause of null safety
    required this.title,
    required this.amount,
    required this.date,
  });
}
