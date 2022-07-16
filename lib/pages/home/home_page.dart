import 'dart:developer';

import 'package:finnapp/constants/color_constants.dart';
import 'package:finnapp/constants/text_style_constants.dart';
import 'package:finnapp/widgets/bar_widgets/bottom_navigation_bar_widget.dart';
import 'package:finnapp/widgets/buttons_widgets/custom_expandable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //**********************INSTANCES**********************//
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];

  //**********************BUILD**********************//
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorConstants.GREY,
        appBar: _appBar(context),
        body: const Center(
          child: Text('Home Page'),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
        floatingActionButton: ExpandableFab(
          distance: 80.0,
          children: [
            Column(
              children: [
                ActionButton(
                  color: ColorConstants.RED,
                  onPressed: () => _showAction(context, 1),
                  icon: const Icon(CupertinoIcons.arrow_down),
                ),
                const SizedBox(height: 3),
                Text(AppLocalizations.of(context)!.outcome),
              ],
            ),
            Column(
              children: [
                ActionButton(
                  color: ColorConstants.GREEN,
                  onPressed: () => _showAction(context, 0),
                  icon: const Icon(CupertinoIcons.arrow_up),
                ),
                const SizedBox(height: 3),
                Text(AppLocalizations.of(context)!.income),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //**********************WIDGETS**********************//
  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.GREY,
      title: Text(AppLocalizations.of(context)!.appName),
      titleTextStyle: TextStyleConstants.TITLE_1_BLACK,
      // APP BAR ACTIONS
      actions: [_appBarActions()],
    );
  }

  // APP BAR ACTIONS
  _appBarActions() {
    return PopupMenuButton(
      icon: const Icon(
        CupertinoIcons.profile_circled,
        color: ColorConstants.DARKER_GREY,
      ),
      iconSize: 40,
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      // APP BAR ACTIONS MENU
      itemBuilder: (context) => [
        _appBarActionsMenuSettings(context),
        _appBarActionsMenuLogOut(context),
      ],
    );
  }

  // APP BAR ACTIONS MENU SETTINGS
  PopupMenuItem<dynamic> _appBarActionsMenuSettings(BuildContext context) {
    return PopupMenuItem(
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.settings,
            style: TextStyleConstants.SUBTITLE_1_DARKER_GREY,
          ),
          const Spacer(),
          const Icon(
            CupertinoIcons.gear,
            color: ColorConstants.DARKER_GREY,
          ),
        ],
      ),
    );
  }

  // APP BAR ACTIONS MENU LOG OUT
  PopupMenuItem<dynamic> _appBarActionsMenuLogOut(BuildContext context) {
    return PopupMenuItem(
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.logOut,
            style: TextStyleConstants.SUBTITLE_1_DARKER_GREY,
          ),
          const Spacer(),
          const Icon(
            Icons.logout,
            color: ColorConstants.DARKER_GREY,
          ),
        ],
      ),
    );
  }

  //**********************METHODS**********************//

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }
}
