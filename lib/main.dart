import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:eticon_api/eticon_api.dart';
import 'package:update_arch/project_utils/app_router.dart';
import 'package:update_arch/project_utils/app_theme.dart';
import 'package:update_arch/repositories/weather_repository.dart';
import 'screens/main_screen/main_screen_provider.dart';
import 'project_utils/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Api.init(urls: ['https://api.openweathermap.org/data/2.5/']);
  getIt.registerLazySingleton(() => WeatherRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: notifier,
      builder: (_, mode, __) => ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) => MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: AppTheme.light().themeData.copyWith(
            extensions: [AppTheme.light()],
          ),
          darkTheme: AppTheme.dark().themeData.copyWith(
            extensions: [AppTheme.dark()],
          ),
          themeMode: mode,
          builder: (context, widget) {
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: widget!);
          },
          localizationsDelegates: const [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
