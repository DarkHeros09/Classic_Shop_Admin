import 'package:classic_shop_admin/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
