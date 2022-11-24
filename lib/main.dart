import 'package:flutter/material.dart';
import 'package:ghmc/notifier.dart';

import 'package:provider/provider.dart';

import 'provider_file.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Notifier()),
          ChangeNotifierProvider(create: (_) => LoadingState())
        ],
        child: MaterialApp(
          initialRoute: AllRoutes.initial,
          routes: AllPages.routes,
        ));
   
  }
}

