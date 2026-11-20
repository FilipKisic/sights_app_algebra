import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sights_app/data/db/hive/hive_adapters.dart';
import 'package:sights_app/data/db/hive/hive_registrar.g.dart';
import 'package:sights_app/firebase_options.dart';
import 'package:sights_app/presentation/config/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initHive();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox(placeBoxName);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      initialRoute: AppRouter.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
