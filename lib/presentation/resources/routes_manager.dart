
import 'package:flutter/material.dart';
import 'package:odella_master/app/di.dart';
import 'package:odella_master/presentation/after_signup/view/after_signup.dart';
import 'package:odella_master/presentation/after_splash/view/after_splash_view.dart';
import 'package:odella_master/presentation/base_home/view/base_home_view.dart';
import 'package:odella_master/presentation/forgot_password/forgot_password_view.dart';
import 'package:odella_master/presentation/login/view/login_view.dart';
import 'package:odella_master/presentation/map_position/view/map_position_view.dart';
import 'package:odella_master/presentation/page/home/view/home_view.dart';
import 'package:odella_master/presentation/page/page_view.dart';
import 'package:odella_master/presentation/resources/strings_manager.dart';
import 'package:odella_master/presentation/signup/view/signUp_view.dart';
import 'package:odella_master/presentation/splash/splash_view.dart';
import 'package:odella_master/presentation/subscription/view/subscription_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mapPositionRoute = "/mapPosition";
  static const String storeDetailRoute = "/storeDetail";
  static const String afterSplashRoute = "/afterSplash";
  static const String signupRoute = "/signup";
  static const String signup1Route = "/signup1";
  static const String subscriptionRoute = "/subscription";


  static const String afterSignUp = "/afterSignUp";
  static const String homeScreen = "/homeScreen";
  static const String baseHomeScreen = "/baseHomeScreen";

  static const String pageScreen = "/pageScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.afterSplashRoute:
        return MaterialPageRoute(builder: (_) => const AfterSplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mapPositionRoute:
       // initMapPositionModule();
        return MaterialPageRoute(builder: (_) => const MapPositionView());
      case Routes.signupRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.afterSignUp:
        return MaterialPageRoute(builder: (_) => const AfterSignUpView());
      case Routes.subscriptionRoute:
        initSubscriptionModule();
        return MaterialPageRoute(builder: (_) => const SubscriptionView());
     case Routes.pageScreen:
        initHomeModule();
        initLogoutModule();
        initProfileModule();
        return MaterialPageRoute(builder: (_) => const PagesView());
      case Routes.homeScreen:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.baseHomeScreen:
        initBaseHomeModule();
        return MaterialPageRoute(builder: (_) => const BaseHomeView());


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    StringsManager.noRouteFound), // string to strings manager
              ),
              body: const Center(
                  child: Text(
                      StringsManager.noRouteFound)), //string to strings manager
            ));
  }
}

