import 'package:classic_shop_admin/src/app_widget.dart';
import 'package:classic_shop_admin/src/app_widget_startup.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      key: UniqueKey(),
      child: AppWidgetStartup(
        onLoaded: (context) {
          return const AppWidget();
        },
      ),
    ),
  );
}
