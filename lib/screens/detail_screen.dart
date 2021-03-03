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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _screenSize.width * Constants.bodyWidthPadding),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(post.title),
                Text(post.user.email),
                Text(DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(post.createdAt))),
                Text(post.contents),
                ReplyList(post.reply),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
