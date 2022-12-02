import 'package:studio_web_app/app/constants/assets.constant.dart';
import 'package:studio_web_app/app/constants/controller.constant.dart';
import 'package:studio_web_app/core/notifiers/connection.notifier.dart';
import 'package:studio_web_app/core/router/router_generator.dart';
import 'package:studio_web_app/meta/utils/app_theme.dart';
import 'package:studio_web_app/meta/utils/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectionNotifier>(context, listen: false).initConnectivity();
    Future.delayed(const Duration(seconds: 3), () {
      navigationController.getOffAll(RouteGenerator.rootScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: Center(child: SvgPicture.asset(Assets.studioLogo, height: 90,),),
    );
  }
}

