import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/widgets/detail_screen/reply_list.dart';

import '../constants.dart';

class DetailScreen extends StatelessWidget {
  final PostDto post;

  DetailScreen(this.post);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(post.id.toString()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildEmailAndDate(_screenSize, _theme),
              Column(
                children: [
                  _buildContents(_screenSize, _theme),
                  ReplyList(post.reply),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildEmailAndDate(Size _screenSize, ThemeData _theme) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: _screenSize.width * Constants.bodyWidthPadding),
      margin: EdgeInsets.only(
          top: _screenSize.height * 0.04, bottom: _screenSize.height * 0.02),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            post.user.email,
            style: _theme.textTheme.bodyText2,
          ),
          Text(
            DateFormat('yyyy-MM-dd').format(
              DateTime.parse(post.createdAt),
            ),
            style: _theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  Padding _buildContents(Size _screenSize, ThemeData _theme) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _screenSize.width * Constants.bodyWidthPadding),
      child: Column(
        children: [
          Container(
            child: Text(
              post.title,
              style: _theme.textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: _screenSize.height * 0.03,
          ),
          Divider(
            color: Colors.black26,
          ),
          SizedBox(
            height: _screenSize.height * 0.04,
          ),
          Text(post.contents),
          SizedBox(
            height: _screenSize.height * 0.04,
          ),
          Divider(
            color: Colors.black26,
          ),
          SizedBox(
            height: _screenSize.height * 0.02,
          ),
        ],
      ),
    );
  }
}
