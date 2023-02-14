import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:update_arch/models/current_weather_model.dart';
import 'package:update_arch/models/weather_model.dart';
import 'package:update_arch/project_utils/app_theme.dart';
import 'package:update_arch/project_utils/pj_icons.dart';
import 'package:update_arch/project_widgets/pj_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:update_arch/project_widgets/pj_loader.dart';
import 'package:update_arch/repositories/weather_repository.dart';
import 'package:update_arch/screens/main_screen/widgets/description_widget.dart';
import 'package:update_arch/screens/main_screen/widgets/weather_card.dart';
import 'cubit/cb_main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget implements AutoRouteWrapper{
  const MainScreen({Key? key}) : super(key: key);
  

  @override
  _MainScreenState createState() => _MainScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbMainScreen>(
      create: (context) => CbMainScreen(),
      child: this,
    );
  }
}

late AppTheme theme;

///1.6 Обновляем экран
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    theme = context.theme();
    return Scaffold(
      body: BlocBuilder<CbMainScreen, StMainScreen>(
        builder: (context, state) => state.when(
          loading: () => const PjLoader(),
          error: (code, message) => _buildError(context, code, message),
          loaded: (weather, currentWeather) => _buildContent(context, weather, currentWeather),
        ),
      ),
    );
  }

  Widget _buildContent(context, WeatherModel weather, CurrentWeatherModel currentWeather) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Text(
            currentWeather.name ?? '',
            style: theme.textStyle(Texts.text16),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            '${DateFormat('HH:mm').format(DateTime.now())} - ${currentWeather.weather[0].description!}',
            style: theme.textStyle(Texts.text16),
          ),
          SizedBox(
            height: 10.h,
          ),
          Image.asset(
            'assets/images/sun.png',
            width: 138.w,
          ),
          Text(
            '${currentWeather.main!.feelsLike!.toInt()}° C',
            style: theme.textStyle(Texts.headerH1),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: 328.w,
            height: 66.h,
            decoration: BoxDecoration(
              color: theme.color(Palette.white, 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DescriptionWidget(value: '1%', assets: PjIcons.rain),
                DescriptionWidget(value: '${currentWeather.main!.humidity}%', assets: PjIcons.humidity),
                DescriptionWidget(value: '${currentWeather.wind!.speed} km/h', assets: PjIcons.rain),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Детальный прогноз',
              style: theme.textStyle(Texts.text16),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Divider(
            height: 1.h,
            color: theme.color(Palette.white),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            height: 86.h,
            child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DateTime dt = DateFormat('yyyyy-MM-dd hh:mm:ss').parse(weather.list[index].dtTxt!);
                  return WeatherCard(
                      value: weather.list[index].main!.feelsLike!.toInt().toString(),
                      time: DateFormat('HH:mm').format(dt));
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 16.w,
                    ),
                itemCount: weather.list.length),
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: () {
              notifier.value = notifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 328.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: theme.color(Palette.white),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  'Сменить тему',
                  style: TextStyle(
                    fontSize: 20.w,
                    color: theme.color(Palette.background),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(context, int? code, String? message) {
    return Container();
  }
}

/// 2.3 Обновляем main_screen
/// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:update_arch/project_utils/pj_utils.dart';
// import 'package:update_arch/project_widgets/pj_appbar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:update_arch/project_widgets/pj_loader.dart';
// import 'cubit/cb_main_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PjAppBar(),
//       body: BlocBuilder<CbMainScreen, StMainScreen>(
//         builder: (context, state) => state.when(
//           loading: () => const PjLoader(),
//           error: (code, message) => _buildError(context, code, message),
//           loaded: () => _buildContent(context),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContent(context) {
//     return Container(
//       color: Colors.green,
//     );
//   }
//
//   Widget _buildError(context, int? code, String? message) {
//     return Container(
//       color: Colors.red,
//     );
//   }
// }
