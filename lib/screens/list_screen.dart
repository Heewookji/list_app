import 'package:flutter/material.dart';
import 'package:list_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  AuthProvider _auth;
  ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<AuthProvider>(context, listen: false);
    _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('list'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _auth.logout(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: _buildContents(),
      ),
    );
  }

  Widget _buildContents() {
    return Column(
      children: [
        Text(
          '${_auth.userId}님 안녕하세요.',
          style: _theme.textTheme.subtitle1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
