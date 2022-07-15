import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finnapp/constants/color_constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  //**********************BUILD**********************//
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorConstants.WHITE,
      selectedItemColor: ColorConstants.BLUE,
      unselectedItemColor: ColorConstants.DARK_GREY,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        // TRANSACTIONS BUTTON
        /// Display the transactions page
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            CupertinoIcons.arrow_up_arrow_down,
          ),
        ),
        // STACTICS BUTTON
        /// Display the statics page
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            CupertinoIcons.chart_bar_alt_fill,
          ),
        ),
        // HOME BUTTON
        /// Display the home page
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            CupertinoIcons.house_fill,
          ),
        ),
        // CATEGORIES BUTTON
        /// Display the categories page
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            CupertinoIcons.tag_fill,
          ),
        ),
        // CARDS BUTTON
        /// Display the cards page
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            CupertinoIcons.square_grid_2x2_fill,
          ),
        ),
      ],
    );
  }

  //**********************WIDGETS**********************//
}
