import 'package:finnapp/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorConstants.GREY,
      body: Center(
        child: Text('CardPage'),
      ),
    );
  }
}
