import 'package:finnapp/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.appName,
          style: TextStyleConstants.TITLE_1_BLUE,
        ),
        const SizedBox(height: 5),
        const Text(
          'Page name',
          style: TextStyleConstants.SUBTITLE_1_DARKER_GREY_S,
        )
      ],
    );
  }
}
