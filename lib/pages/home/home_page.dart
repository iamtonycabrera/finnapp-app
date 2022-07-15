import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finnapp/constants/color_constants.dart';
import 'package:flutter_finnapp/constants/text_style_constants.dart';
import 'package:flutter_finnapp/widgets/bar_widgets/bottom_navigation_bar_widget.dart';
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
        floatingActionButton: _speedDialWidget(context),
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

  _speedDialWidget(BuildContext context) {
    return SpeedDial(
      backgroundColor: ColorConstants.BLUE,
      overlayColor: Colors.black,
      overlayOpacity: 0.3,
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      dialRoot: customDialRoot
          ? (ctx, open, toggleChildren) {
              return ElevatedButton(
                onPressed: toggleChildren,
                child: const Text(''),
              );
            }
          : null,
      buttonSize: buttonSize,
      childrenButtonSize: childrenButtonSize,
      visible: visible,
      direction: speedDialDirection,
      switchLabelPosition: switchLabelPosition,
      closeManually: closeManually,
      renderOverlay: renderOverlay,
      onOpen: () => log('OPENING DIAL'),
      onClose: () => log('DIAL CLOSED'),
      useRotationAnimation: useRAnimation,
      tooltip: 'Open Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      elevation: 8.0,
      animationCurve: Curves.elasticInOut,
      isOpenOnStart: false,
      animationDuration: const Duration(milliseconds: 300),
      shape: customDialRoot
          ? const RoundedRectangleBorder()
          : const StadiumBorder(),
      // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        SpeedDialChild(
          child: !rmicons ? const Icon(CupertinoIcons.arrow_down) : null,
          backgroundColor: ColorConstants.RED,
          foregroundColor: ColorConstants.WHITE,
          labelWidget: Text(
            AppLocalizations.of(context)!.outcome,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {}, // TODO
          onLongPress: () => log('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: !rmicons ? const Icon(CupertinoIcons.arrow_up) : null,
          backgroundColor: ColorConstants.GREEN,
          foregroundColor: ColorConstants.WHITE,
          labelWidget: Text(
            AppLocalizations.of(context)!.income,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {}, // TODO
          onLongPress: () => log('Second CHILD LONG PRESS'),
        ),
      ],
    );
  }
}
