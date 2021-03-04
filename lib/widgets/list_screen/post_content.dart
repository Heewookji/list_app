import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/models/post_dto.dart';

import '../../constants.dart';

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
        margin: EdgeInsets.symmetric(
          vertical: _screenSize.height * 0.012,
          horizontal: _screenSize.width * Constants.bodyWidthPadding,
        ),
        padding: EdgeInsets.all(_screenSize.width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
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
            _buildHeader(_theme),
            Divider(color: Colors.black45),
            _buildEmailAndDate(_theme),
            SizedBox(
              height: _screenSize.height * 0.01,
            ),
            Text(
              post.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: _theme.textTheme.bodyText1,
            ),
            SizedBox(
              height: _screenSize.height * 0.01,
            ),
            Text(
              post.contents,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: _theme.textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }

  Text _buildEmailAndDate(ThemeData _theme) {
    return Text(
      post.user.email +
          '  |  ' +
          DateFormat('yyyy-MM-dd').format(DateTime.parse(post.createdAt)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: _theme.textTheme.caption,
    );
  }

  Row _buildHeader(ThemeData _theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          post.category.name,
          style: _theme.textTheme.bodyText2,
        ),
        Text(
          post.id.toString(),
          style: _theme.textTheme.bodyText2,
        ),
      ],
    );
  }
}
