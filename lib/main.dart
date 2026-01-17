import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cofig/routes/route_generator.dart';
import 'cofig/routes/routes.dart';
import 'core/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: MyTheme.themeData,
          initialRoute: Routes.navigationBarView,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
  }
}
