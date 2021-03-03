import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/models/reply_dto.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(post.title),
              Text(post.user.email),
              Text(DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(post.createdAt))),
              Text(post.contents),
              for (int i = 0; i < post.reply.length; i++)
                _buildReply(_screenSize, post.reply[i]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReply(Size _screenSize, ReplyDto reply) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: _screenSize.width * 0.7,
                child: Text(reply.user.name),
              ),
              Text(reply.id.toString()),
            ],
          ),
          Divider(color: Colors.black45),
          Text(
            DateFormat('yyyy-MM-dd').format(DateTime.parse(reply.createdAt)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            post.contents,
//            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
