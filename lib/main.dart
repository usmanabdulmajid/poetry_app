import 'package:flutter/material.dart';
import 'package:poetry_app/cache/sql_cache.dart';
import 'package:poetry_app/core/api/api_client.dart';
import 'package:poetry_app/repository/poem_repository_imp.dart';
import 'package:poetry_app/viewmodel/poem_provider.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PoemProvider>(
      create: (context) =>
          PoemProvider(PoemRepositoryImp(ApiClient(), SqlCache())),
      child: MaterialApp(
        title: 'Poetry App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.home,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
