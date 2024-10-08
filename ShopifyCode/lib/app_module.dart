import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopify_code/session/session.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'database/database_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Database> get database => DataBaseService.CreateDatabase();

  @preResolve
  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();

}