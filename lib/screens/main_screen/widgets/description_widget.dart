import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:update_arch/project_utils/app_theme.dart';

class DescriptionWidget extends StatelessWidget {
  final String assets;
  final String value;
  const DescriptionWidget({Key? key, required this.value, required this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(assets),
        SizedBox(width: 5.w,),
        Text(value, style: theme.textStyle(Texts.text16),),
      ],
    );
  }
}
