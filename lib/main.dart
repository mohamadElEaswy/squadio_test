import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_test/src/features/details/provider/details_provider.dart';
import 'package:squadio_test/src/network/network.dart';

import 'src/features/home/provider/home_provider.dart';
import 'src/features/home/ui/home_page.dart';

//api key
// 83056528c7a4f5e750fb0e302e0a5c9f
// String apiKey = '83056528c7a4f5e750fb0e302e0a5c9f';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkHelper.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()..getHomeData()),
        ChangeNotifierProvider(create: (_) => DetailsProvider()),
        // Provider<AnotherThing>(create: (_) => AnotherThing()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
