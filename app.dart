import 'package:flutter/material.dart';

import 'routes.dart';
import 'views/auth/auth_screen.dart';
import 'views/auth/forgot_password_screen.dart';
import 'views/auth/sign_in_screen.dart';
import 'views/auth/sign_up_screen.dart';
import 'views/home/home_screen.dart';
import 'views/loading/preparing_plan_screen.dart';
import 'views/questionnaire/profile_setup_screen.dart';
import 'views/splash/splash_screen.dart';
import 'views/welcome/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.auth:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.profileSetup:
        return MaterialPageRoute(builder: (_) => const ProfileSetupScreen());
      case Routes.preparingPlan:
        return MaterialPageRoute(builder: (_) => const PreparingPlanScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
