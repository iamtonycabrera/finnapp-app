import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finnapp/constants/color_constants.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState extends State<FloatingActionButtonWidget>
    with SingleTickerProviderStateMixin {
  //**********************INSTANCES**********************//
  late AnimationController _controller;
  double _angle = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _controller.addListener(() {
      setState(() {
        _angle = _controller.value * 135 / 360 * pi * 2;
      });
    });
  }

  //**********************BUILD**********************//
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorConstants.BLUE,
      onPressed: () => _rotateIconOnTap(),
      child: Transform.rotate(
        angle: _angle,
        child: const Icon(
          CupertinoIcons.add,
        ),
      ),
    );
  }

  //**********************METHODS**********************//
  /// Checks animation status
  _rotateIconOnTap() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }
}
