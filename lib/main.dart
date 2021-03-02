import 'package:flutter/material.dart';
import 'package:list_app/providers/auth_provider.dart';
import 'package:list_app/screens/home_tab_screen.dart';
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
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'listApp',
          debugShowCheckedModeBanner: false,
          theme: ThemeBuilder.rootThemeBuild(),
          home: auth.isAuth
              ? HomeTabScreen()
              : FutureBuilder(
                  future: auth.autoLogin(),
                  builder: (ctx, resultSnapshot) {
                    return resultSnapshot.connectionState ==
                            ConnectionState.waiting
                        ? Scaffold(
                            body: Center(child: CircularProgressIndicator()))
                        : LoginScreen();
                  },
                ),
        ),
      ),
    );
  }
}
