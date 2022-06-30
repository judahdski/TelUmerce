import 'package:shared_preferences/shared_preferences.dart';

import '../../const/key.dart';

Future<String?> getTheToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(tokenKey);
}
