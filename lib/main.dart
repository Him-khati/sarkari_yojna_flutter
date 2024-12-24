import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:relative_time/relative_time.dart';
import 'package:sarkari_yojna_flutter/di/di_initializer.dart';
import 'package:sarkari_yojna_flutter/route/route_config.dart';
import 'package:sarkari_yojna_flutter/utils/theme.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiInitializer.initializeDI(
    getIt
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        title: 'Sarkari Yojna',
        theme: context.lightTheme(context),
        darkTheme: context.darkTheme(context),
        themeMode: ThemeMode.system,
        routerConfig: router,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          RelativeTimeLocalizations.delegate,
        ],
      ),
    );
  }
}
