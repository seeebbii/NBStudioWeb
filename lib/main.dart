import 'package:firebase_core/firebase_core.dart';
import 'package:studio_web_app/core/notifiers/connection.notifier.dart';
import 'package:studio_web_app/core/router/router_generator.dart';
import 'package:studio_web_app/meta/utils/app_theme.dart';
import 'package:studio_web_app/meta/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/providers/multi_providers.dart';
import 'core/controller/navigation_controller.dart';
import 'meta/utils/hive_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDJbHlsBRkTlAQpJhAUIDvwTydMB52omeI',
        appId: '1:246126326266:web:d7db5afc7aaac488ef3443',
        messagingSenderId: '246126326266',
        projectId: 'studioweb-235b8',
        storageBucket: "studioweb-235b8.appspot.com",
      )
  );
  debugPrint("Initialized default app: $app");
  Get.put(NavigationController());
  await SharedPref.init();
  await ConnectionNotifier().initConnectivity();
  await HiveDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // CHECKING IF THE USER IS PRE LOGGED IN
    if(HiveDatabase.getValue(HiveDatabase.loginCheck) != true){
      HiveDatabase.storeValue(HiveDatabase.authToken, "null");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: ScreenUtilInit(
          builder: (_, w) => MultiProviders(
            GetMaterialApp(
              title: "Studio Web",
              debugShowCheckedModeBanner: false,
              initialRoute: RouteGenerator.splashScreen,
              onGenerateRoute: RouteGenerator.onGeneratedRoutes,
              theme: AppTheme.darkTheme,
              builder: EasyLoading.init(),
            ),
          )
      ),
    );
  }
}


