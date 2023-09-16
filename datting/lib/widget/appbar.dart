import 'package:datting/widget/back.dart';
import 'package:flutter/material.dart';

appBar({List<Widget>? action, required BuildContext context}) {
  return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Back(),
      actions: action);
}
