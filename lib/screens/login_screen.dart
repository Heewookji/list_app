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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _screenSize.width * Constants.bodyWidthPadding),
            child: Container(
              height: 240 > _screenSize.height * 0.3
                  ? 240
                  : _screenSize.height * 0.3,
              padding: EdgeInsets.all(_screenSize.width * 0.08),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'List App',
                    style: _theme.textTheme.subtitle1,
                  ),
                  _buildForm(),
                  _buildFlatButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey, //assigning key to form
      child: Container(
        margin: EdgeInsets.only(top: _screenSize.height * 0.02),
        height: 80 > _screenSize.height * 0.09 ? 80 : _screenSize.height * 0.09,
        child: TextFormField(
          controller: _controller,
          style: _theme.textTheme.bodyText1,
          validator: _validator,
          decoration: InputDecoration(
            labelText: '닉네임을 입력해주세요',
            labelStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.person, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.teal),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
          ),
        ),
      ),
    );
  }

  FlatButton _buildFlatButton() {
    return FlatButton(
      height: 40 > _screenSize.height * 0.05 ? 40 : _screenSize.height * 0.05,
      onPressed: () => _submit(),
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: _isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              '로그인',
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
