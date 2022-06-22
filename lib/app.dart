import 'package:flutter/material.dart';
import 'package:flutter_app/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale locale = ref.watch(localeProvider);
    return MaterialApp(
          locale: locale,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('my'),
            Locale('en'),
          ],
          theme: ThemeData(),
          darkTheme: ThemeData.light(),
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                
                  default:
                    return HomePage();
                }
              },
            );
          },
        );
  }
}

final localeProvider = StateProvider<Locale>((ref) {
  return const Locale('en', 'US');
});
