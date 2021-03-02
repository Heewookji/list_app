import 'package:flutter/material.dart';
import 'package:list_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () =>
                Provider.of<AuthProvider>(context, listen: false).logout(),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
