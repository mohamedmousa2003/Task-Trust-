import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cofig/routes/route_generator.dart';
import 'cofig/routes/routes.dart';
import 'core/enum/enum_language.dart';
import 'core/styles/theme.dart';
import 'di/injectable.dart';
import 'features/profile/presentation/view_model/lanage_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(BlocProvider(create: (_) => LanguageCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<LanguageCubit, Language>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: MyTheme.themeData,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              locale: state == Language.en
                  ? const Locale('en')
                  : const Locale('ar'),
              supportedLocales: const [Locale('en'), Locale('ar')],
              initialRoute: Routes.navigationBarView,
              onGenerateRoute: RouteGenerator.getRoute,
            );
          },
        );
      },
    );
  }
}
