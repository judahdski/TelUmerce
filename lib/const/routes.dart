import 'package:telumerce/views/pages/auth/login_screen.dart';
import 'package:telumerce/views/pages/auth/signup_screen.dart';
import 'package:telumerce/views/pages/fragment/main_window.dart';

final routes = {
  '/main': (context) => const MainWindow(0),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
};


