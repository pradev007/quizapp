import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/AboutUs/about_us.dart';
import 'package:quizapp/HomePage/home_page.dart';
import 'package:quizapp/ResultPage/result_page.dart';
import 'package:quizapp/Routes/app_route_const.dart';
import 'package:quizapp/Settings/setting_page.dart';
import 'package:quizapp/qn_option.dart';

//GoRouter Configuration
final myRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    // Optional, add name to your routes. Allows you navigate by name instead of path
    name: MyRouterConstant.homeRouteName,
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return HomePage();
    },
  ),

  GoRoute(
      name: MyRouterConstant.resultPageRouteName,
      path: '/resultPage',
      builder: (BuildContext context, GoRouterState state) {
        final score = state.extra as int;
        return ResultPage(score: score);
        // return const ResultPage();
      }),
  GoRoute(
      name: MyRouterConstant.qnoptionpage,
      path: '/qnoptionPage',
      builder: (BuildContext context, GoRouterState state) {
        return const QnOption();
      }),
  // GoRoute(
  //     name: MyRouterConstant.fetchPdfRouteName,
  //     path: '/fetchPdfPage',
  //     builder: (BuildContext context, GoRouterState state) {
  //       return const FetchPdf();
  //     }),
  GoRoute(
      name: MyRouterConstant.settingPageName,
      path: '/settingPage',
      builder: (BuildContext context, GoRouterState state) {
        return SettingPage();
      }),
  GoRoute(
      name: MyRouterConstant.aboutUsPageName,
      path: '/aboutUsPage',
      builder: (BuildContext context, GoRouterState state) {
        return const AboutUs();
      }),
]);
