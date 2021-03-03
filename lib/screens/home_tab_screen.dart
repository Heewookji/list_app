import 'package:flutter/material.dart';
import 'package:list_app/providers/auth_provider.dart';
import 'package:list_app/providers/posts_with_ads_provider.dart';
import 'package:list_app/screens/list_screen.dart';
import 'package:provider/provider.dart';

class HomeTabScreen extends StatefulWidget {
  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  AuthProvider _auth;
  List<Widget> _pages;
  List<Category> _categories;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _auth = Provider.of<AuthProvider>(context, listen: false);
    _categories = [
      Category.apple,
      Category.banana,
      Category.coconut,
    ];
    _pages = [
      ChangeNotifierProvider(
        key: ValueKey(_categories[0]),
        create: (ctx) => PostsWithAdsProvider(_categories[0]),
        child: ListScreen(),
      ),
      ChangeNotifierProvider(
        key: ValueKey(_categories[1]),
        create: (ctx) => PostsWithAdsProvider(_categories[1]),
        child: ListScreen(),
      ),
      ChangeNotifierProvider(
        key: ValueKey(_categories[2]),
        create: (ctx) => PostsWithAdsProvider(_categories[2]),
        child: ListScreen(),
      ),
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            '${_auth.userId}님 안녕하세요.',
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => _auth.logout(),
            ),
          ],
          bottom: TabBar(
            onTap: _selectPage,
            tabs: [
              Tab(text: 'Apple'),
              Tab(text: 'Banana'),
              Tab(text: 'Coconut'),
            ],
          ),
        ),
        body: SafeArea(
          child: IndexedStack(
            children: _pages,
            index: _selectedIndex,
          ),
        ),
      ),
    );
  }
}
