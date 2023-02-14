import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:update_arch/project_utils/app_theme.dart';

class PjLoader extends StatelessWidget {
  const PjLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    return Center(
      child: CupertinoActivityIndicator(color: theme.color(Palette.white),),
    );
  }
}
