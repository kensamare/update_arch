import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:update_arch/project_utils/app_theme.dart';
import 'package:update_arch/project_utils/pj_icons.dart';

class WeatherCard extends StatelessWidget {
  final String time;
  final String value;

  const WeatherCard({Key? key, required this.value, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    return Container(
      width: 57.w,
      height: 86.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: theme.color(Palette.blue),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: theme.textStyle(Texts.text12),
            ),
            SizedBox(height: 10.h,),
            SvgPicture.asset(PjIcons.cloudIcon),
            Text(
              '$value°',
              style: theme.textStyle(Texts.text16),
            ),
          ],
        ),
      ),
    );
  }
}
