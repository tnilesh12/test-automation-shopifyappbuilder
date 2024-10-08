// import 'package:flutter/material.dart';
// // import '/localizations/localization_cubit.dart';
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import '/main.dart';
// import '/theme/app_theme.dart';
// import '/theme/theme_cubit.dart';
// export 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopify_code/language/localization_cubit.dart';
// // import '/localizations/localization_cubit.dart';
// import '/test/resources_widget_dark_mode_testing.dart';
// import '/settings.dart';

// import '/settings.dart';
// // export 'package:flutter_localizations/flutter_localizations.dart';


// // void main() {
// //   runApp(const MyApp());
// // }

// final navigatorKey = GlobalKey<NavigatorState>();

// class MyApp1 extends StatelessWidget {
//   const MyApp1({super.key});
  
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(providers: [
//       BlocProvider<ThemeCubit>(
//         create: (BuildContext context) => ThemeCubit(),
//       ),
//       BlocProvider<LocalizationCubit>(
//         create: (BuildContext context) => LocalizationCubit(),
//       ),
//       // BlocProvider<BaseBloc>(create: (context) {
//       //   return BaseBloc();
//       // }),
//     ], child: AppView());
//   }
// }

// class AppView extends StatelessWidget {
//   /// {@macro app_view}
//   ///
//   const AppView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // getIt<Database>()projectRepository.SessionListOfMatch("289","NResult");
//     return BlocBuilder<ThemeCubit, ThemeData>(
//       builder: (_, theme) {
//         return BlocBuilder<LocalizationCubit, Locale>(builder: (_, local) {
//           return MaterialApp(
//               // localizationsDelegates: const [
//                 // AppLocalizations.delegate, // Add this line
//                 // GlobalMaterialLocalizations.delegate,
//                 // GlobalWidgetsLocalizations.delegate,
//                 // GlobalCupertinoLocalizations.delegate,
//               // ],
//               // supportedLocales: const [
//               //   Locale('en'), // English
//               //   Locale('es'), // Spanish
//               //   Locale('hi'),
//               // ],
//               locale: local,
//               debugShowCheckedModeBanner: false,
//               // onGenerateRoute: RouteGenerate.generateRoute,
//               theme: theme,
//               home: SettingScreen(),
//     navigatorKey: navigatorKey, // Setting a global key for navigator
//               // initialRoute: RouteGenerate.splashScreen
//            );
//         });
//       },
//     );
//   }
// }

