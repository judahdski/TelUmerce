import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future<String?> getTheToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(tokenConst);
}