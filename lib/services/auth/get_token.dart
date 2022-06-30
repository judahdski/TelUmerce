import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/services/auth/create_storage.dart';

import '../../const/key.dart';

Future<String?> getTheToken() async {
  // SharedPreferences pref = await SharedPreferences.getInstance();
  var value = await storage.read(key: tokenKey);
  if(value == null) {
    return "";
  }else{
    return value;
  }

}
