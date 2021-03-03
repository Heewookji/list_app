import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/models/reply_dto.dart';

class ReplyList extends StatelessWidget {
  final BuiltList<ReplyDto> replyList;
  ReplyList(this.replyList);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    Size _screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        for (int i = 0; i < replyList.length; i++)
          _buildReply(_screenSize, replyList[i])
      ],
    );
  }

  Container _buildReply(Size _screenSize, ReplyDto reply) {
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
            reply.contents,
          ),
        ],
      ),
    );
  }
}
