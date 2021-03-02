import 'package:flutter/material.dart';
import 'package:list_app/providers/auth_provider.dart';
import 'package:list_app/providers/posts_provider.dart';
import 'package:list_app/screens/list_screen.dart';
import 'package:list_app/screens/login_screen.dart';
import 'package:list_app/theme_builder.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostsProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'listApp',
          debugShowCheckedModeBanner: false,
          theme: ThemeBuilder.rootThemeBuild(),
          home: auth.isAuth
              ? ListScreen()
              : FutureBuilder(
                  future: auth.autoLogin(),
                  builder: (ctx, resultSnapshot) => LoginScreen(),
                ),
        ),
      ),
    );
  }
}
