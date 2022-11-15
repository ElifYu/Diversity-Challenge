import 'package:diversity_challenge/configs/bottom_nav_page.dart';
import 'package:diversity_challenge/helper/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppNavigator());
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      builder: (context, _) {
        return MaterialApp(
          title: 'Diversity Challenge',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.grey[900],
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.black87
            )
          ),
          home: BottomNavPage(),
        );
      }
    );
  }
}



