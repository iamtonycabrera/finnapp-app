import 'package:finnapp/constants/color_constants.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorConstants.GREY,
      body: Center(
        child: Text('TransactionsPage'),
      ),
    );
  }
}
