import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/models/post_dto.dart';

class PostContent extends StatelessWidget {
  final Function(BuildContext, PostDto) _navigateToDetailScreen;
  final PostDto post;
  PostContent(this._navigateToDetailScreen, this.post);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _navigateToDetailScreen(context, post),
      child: Container(
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
                Text(post.category.name),
                Text(post.id.toString()),
              ],
            ),
            Divider(color: Colors.black45),
            Text(
              post.user.email +
                  '  |  ' +
                  DateFormat('yyyy-MM-dd')
                      .format(DateTime.parse(post.createdAt)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              post.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              post.contents,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
