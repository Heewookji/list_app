import 'package:flutter/material.dart';
import 'package:list_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> _submit() async {
    final userId = _controller.text;
    if (userId.length < 4) return;
    setState(() {
      _isLoading = true;
    });
    await Provider.of<AuthProvider>(context, listen: false).login(userId);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _controller,
            autofocus: true,
          ),
          FlatButton(
            onPressed: () => _submit(),
            child: _isLoading ? CircularProgressIndicator() : Text('login'),
          )
        ],
      ),
    );
  }
}
