import 'package:flutter/material.dart';
import 'package:flutter_finnapp/constants/route_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppUtil {
  //**********************INSTANCES**********************//
  //final _connectivity = Connectivity();
  //final _read = StorageUtil();
  //final _authService = AuthService();
  BuildContext? _context;
  //**********************METHODS**********************//
  Future<String> getInitialRoute() async {
    return RouteConstants.HOME_PAGE;
    /*final value = await _read.read(KeysConstant.WELCOME_PAGE_KEY);

    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return RouteConstants.INTERNET_DISABLED;
    } else {
      if (value == KeysConstant.TRUE) {
        if (await _authService.checkIfUserIsLoggedin() == true) {
          return RouteConstants.HOME_PAGE;
        }
        return RouteConstants.LOGIN_PAGE;
      } else {
        return RouteConstants.WELCOME_PAGE;
      }
    }*/
  }

  /// Sets the context for using the internationalization
  setContext(BuildContext context) {
    _context = context;
  }

  String getEstablishmentCategory(String concept) {
    switch (concept.toUpperCase()) {
      case 'BILLS':
        return AppLocalizations.of(_context!)!.bills;
      case 'CLOTHES':
        return AppLocalizations.of(_context!)!.clothes;
      case 'ENTERTAINMENT':
        return AppLocalizations.of(_context!)!.entertainment;
      case 'FOOD':
        return AppLocalizations.of(_context!)!.food;
      case 'HEALTH':
        return AppLocalizations.of(_context!)!.health;
      case 'PET':
        return AppLocalizations.of(_context!)!.pet;
      case 'TRANSPORT':
        return AppLocalizations.of(_context!)!.transport;
      case 'TRIP':
        return AppLocalizations.of(_context!)!.trip;
      default:
        return '';
    }
  }
}
