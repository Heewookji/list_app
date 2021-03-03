import 'package:flutter/material.dart';
import 'package:list_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  ThemeData _theme;
  Size _screenSize;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> _submit() async {
    final userId = _controller.text;
    if (!_formKey.currentState.validate()) return;
    setState(() {
      _isLoading = true;
    });
    await Provider.of<AuthProvider>(context, listen: false).login(userId);
    setState(() {
      _isLoading = false;
    });
  }

  String _validator(String value) {
    if (value.length < 4) return '4글자 이상을 입력해주세요.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('List App'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _screenSize.width * Constants.bodyWidthPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey, //assigning key to form
              child: TextFormField(
                controller: _controller,
                autofocus: true,
                validator: _validator,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                ),
              ),
            ),
            FlatButton(
              onPressed: () => _submit(),
              child: _isLoading ? CircularProgressIndicator() : Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
