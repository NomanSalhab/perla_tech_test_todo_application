import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'repository/theme_repo.dart';
import 'view_models/bloc/items_list/items_list_bloc.dart';
import 'view_models/home_view_model.dart';
import 'view_models/login_view_model.dart';
import 'view_models/register_view_model.dart';
import 'view_models/router.dart';
import 'view_models/session_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await Hive.openBox('user');
  // ItemsRepo().open();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(
          // loggedIn: Hive.box('user').get('loggedIn') ?? false,
          ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key /*, required this.loggedIn*/
      });

  // final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => SessionViewModel()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ItemsListBloc()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          ensureScreenSize: true,
          builder: (context, child) {
            return Consumer<SessionViewModel>(builder: (context, model, _) {
              model.setArabic(context);
              return MaterialApp.router(
                routerConfig: router,
                title: 'Flutter Perla Tech Test',
                theme: /*state.themeData*/ model.getDarkMode
                    ? AppTheme().darkTheme
                    : AppTheme().lightTheme,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
              );
            });
          },
        ),
      ),
    );
  }
}
