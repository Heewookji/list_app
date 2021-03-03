import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/providers/posts_provider.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _isLoading = false;
  bool _isScrollLoading = false;
  ThemeData _theme;
  Size _screenSize;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    _doFutureInit();
  }

  Future<void> _doFutureInit() async {
    try {
      await Provider.of<PostsProvider>(context, listen: false)
          .fetchAndSetPosts();
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.04),
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildPostList(),
    );
  }

  Widget _buildPostList() {
    return Consumer<PostsProvider>(
      builder: (ctx, provider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!_isScrollLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  setState(() {
                    _isScrollLoading = true;
                  });
                  provider
                      .fetchAndSetNextPosts()
                      .then((value) => _isScrollLoading = false);
                }
                return true;
              },
              child: ListView.builder(
                itemCount: provider.posts.length + 1,
                itemBuilder: (ctx, i) {
                  if (i == provider.posts.length)
                    return _isScrollLoading
                        ? Center(child: CircularProgressIndicator())
                        : Container();
                  final post = provider.posts[i];
                  return Column(
                    children: [
                      _buildPost(post),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPost(PostDto post) {
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
              Text(post.category.name),
              Text(post.id.toString()),
            ],
          ),
          Divider(color: Colors.black45),
          Text(
            post.user.email +
                '  |  ' +
                DateFormat('yyyy-MM-dd').format(DateTime.parse(post.createdAt)),
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
    );
  }
}
