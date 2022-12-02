
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_web_app/core/notifiers/connection.notifier.dart';
import 'package:studio_web_app/core/notifiers/form.notifier.dart';
import 'package:studio_web_app/core/view_models/authentication_VM.dart';
import 'package:studio_web_app/core/view_models/pageview_VM.dart';

class MultiProviders extends StatelessWidget {
  const MultiProviders(this.child, {Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<ConnectionNotifier>(
          create: (BuildContext context) => ConnectionNotifier(),
        ),

        ChangeNotifierProvider<PageViewVM>(
          create: (BuildContext context) => PageViewVM(),
        ),

        ChangeNotifierProvider<AuthenticationScreenVM>(
          create: (BuildContext context) => AuthenticationScreenVM(),
        ),

        ChangeNotifierProvider<FormNotifier>(
          create: (BuildContext context) => FormNotifier(),
        ),

      ],
      child: child,
    );
  }
}
