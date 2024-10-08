import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:shopify_code/language/localization_cubit.dart';
import 'package:readygolf/common/views/splash_screen/bloc/main_splash_screen_bloc.dart';
import 'package:readygolf/common/views/splash_screen/bloc/main_splash_screen_state.dart';
import 'package:readygolf/common/views/splash_screen/main_splash_screen.dart';
import 'package:readygolf/route/go_routes.dart';
import 'package:readygolf/views/category/bloc/category_screen_bloc.dart';
import 'package:readygolf/views/common_bloc/cart_count/cart_bloc.dart';
import 'package:readygolf/views/countrycode/bloc/country_code_bloc.dart';
import 'package:readygolf/views/profile_screen/bloc/bloc/profile_screen_bloc.dart';
import 'package:readygolf/utils/dismisskeyboard.dart';

import 'views/splash_screen/bloc/splash_screen_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

// void main() async {
//   // runApp(const MyApp());//routerConfig: router,));

// }

class MyApp1 extends StatelessWidget {
  String? isPublished;
  String? themeName;
  MyApp1({this.themeName="", this.isPublished="yes", super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MultiBlocProvider(providers: [
      BlocProvider<MainSplashScreenBloc>(
        create: (context) => MainSplashScreenBloc(themeName!, isPublished!),
      
      ),
  BlocProvider<SplashScreenBloc>(
    lazy: true,
        create: (context) => SplashScreenBloc(themeName!, isPublished!),
      
      ),
      // BlocProvider<ThemeCubit>(
      //   create: (BuildContext context) => ThemeCubit(),
      // ),
      BlocProvider<LocalizationCubit>(
        create: (BuildContext context) => LocalizationCubit(),
      ),
      BlocProvider<CartBloc>(create: (context) {
        return CartBloc();
      }),
      BlocProvider<CountryCodeBloc>(create: (context) {
        return CountryCodeBloc();
      }),
      BlocProvider<CategoryScreenBloc>(
        lazy: true,
        create: (context) => CategoryScreenBloc(),
      ),
      BlocProvider<ProfileScreenBloc>(
        lazy: true,
        create: (context) => ProfileScreenBloc(),
      ),
    ], child: AppView());

/*
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // textTheme: AppTheme.textTheme,
          platform: TargetPlatform.iOS,
        ),
        routerConfig: goRouter,
        //for drawer 2
        // NavigationHomeScreen()
        );
        */
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final scale = mediaQueryData.textScaler.clamp(
      minScaleFactor: 0.80, // Minimum scale factor allowed.
      maxScaleFactor: 1.0, // Maximum scale factor allowed.
    );

    return DismissKeyboard(
      child: BlocBuilder<MainSplashScreenBloc, MainSplashScreenState>(
          builder: (context, state) {
        // return BlocBuilder<ThemeCubit, ThemeData>(
        //   builder: (_, theme) {
        return BlocBuilder<LocalizationCubit, Locale>(builder: (_, local) {
          return MediaQuery(
            data: mediaQueryData.copyWith(textScaler: scale),
            child: MaterialApp.router(
              routerConfig: goRouter,
              scaffoldMessengerKey: scaffoldMessengerKey,

              // localizationsDelegates: const [
              // AppLocalizations.delegate, // Add this line
              // GlobalMaterialLocalizations.delegate,
              // GlobalWidgetsLocalizations.delegate,
              // GlobalCupertinoLocalizations.delegate,
              // ],
              // supportedLocales: const [
              //   Locale('en'), // English
              //   Locale('es'), // Spanish
              //   Locale('hi'),
              // ],
              locale: local,
              debugShowCheckedModeBanner: false,
              // onGenerateRoute: RouteGenerate.generateRoute,
              theme: context.read<MainSplashScreenBloc>().themeData,

              // initialRoute: RouteGenerate.splashScreen

              // routeInformationParser: RouteGenerate.returnRouter().routeInformationParser,
              // routerDelegate: RouteGenerate.returnRouter().routerDelegate,
            ),
          );
          // });
        });
        //   },
        // );
      }),
    );
  }
}
