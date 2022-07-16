import 'package:finnapp/constants/color_constants.dart';
import 'package:finnapp/constants/text_style_constants.dart';
import 'package:finnapp/pages/main/categories/categories_page.dart';
import 'package:finnapp/pages/main/main/main_page.dart';
import 'package:finnapp/pages/main/more_options/more_options_page.dart';
import 'package:finnapp/pages/main/statics/statics_page.dart';
import 'package:finnapp/pages/main/transactions/transactions_page.dart';
import 'package:finnapp/services/ui_provider.dart';
import 'package:finnapp/widgets/bar_widgets/bottom_navigation_bar_widget.dart';
import 'package:finnapp/widgets/buttons_widgets/custom_expandable_fab.dart';
import 'package:finnapp/widgets/page_title/page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //**********************INSTANCES**********************//

  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];

  //**********************BUILD**********************//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _HomePageBody(),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      floatingActionButton: _expandableFab(context),
    );
  }

  //**********************WIDGETS**********************//
  // APP BAR
  _appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: ColorConstants.GREY,
      title: const PageTitle(),
      // APP BAR ACTIONS
      actions: [_appBarActions()],
      bottom: _searchBar(context),
    );
  }

  // APP BAR ACTIONS
  _appBarActions() {
    return PopupMenuButton(
      icon: const Icon(
        CupertinoIcons.profile_circled,
        color: ColorConstants.DARKER_GREY,
      ),
      iconSize: 45,
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

  // SEARCH BAR
  _searchBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight - 10),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ColorConstants.WHITE,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              color: ColorConstants.WHITE,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    CupertinoIcons.search,
                    color: ColorConstants.DARK_GREY,
                    size: 27,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      // textAlign: TextAlign.center,
                      decoration: InputDecoration.collapsed(
                        hintStyle: TextStyleConstants.SUBTITLE_1_DARK_GREY,
                        hintText:
                            '${AppLocalizations.of(context)!.searchBarHint}...',
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  // EXPANDABLE FAB
  _expandableFab(BuildContext context) {
    return ExpandableFab(
      distance: 80.0,
      children: [
        _outcomeButton(context),
        _incomeButton(context),
      ],
    );
  }

  // OUTCOME BUTTON
  _outcomeButton(BuildContext context) {
    return Column(
      children: [
        ActionButton(
          color: ColorConstants.RED,
          onPressed: () => _showAction(context, 1),
          icon: const Icon(CupertinoIcons.arrow_down),
        ),
        const SizedBox(height: 3),
        Text(AppLocalizations.of(context)!.outcome),
      ],
    );
  }

  // INCOME BUTTON
  _incomeButton(BuildContext context) {
    return Column(
      children: [
        ActionButton(
          color: ColorConstants.GREEN,
          onPressed: () => _showAction(context, 0),
          icon: const Icon(CupertinoIcons.arrow_up),
        ),
        const SizedBox(height: 3),
        Text(AppLocalizations.of(context)!.income),
      ],
    );
  }

  //**********************METHODS**********************//
  /// Its show dialog on buttons tap
  // TODO: Widget to show if income or outcome
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

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);

    final int currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const TransactionsPage();
      case 1:
        return const StaticsPage();
      case 2:
        return const MainPage();
      case 3:
        return const CategoriesPage();
      case 4:
        return const MoreOptionsPage();
      default:
        return const MainPage();
    }
  }
}
