import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/providers/auth_provider.dart';
import 'package:list_app/providers/posts_provider.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _isLoading = false;
  AuthProvider _auth;
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
      _isLoading = false;
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<AuthProvider>(context, listen: false);
    _theme = Theme.of(context);
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '${_auth.userId}님 안녕하세요.',
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _auth.logout(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.04),
        child: _buildPostList(),
      ),
    );
  }

  Widget _buildPostList() {
    return Consumer<PostsProvider>(
      builder: (ctx, provider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.posts.length,
              itemBuilder: (ctx, i) {
                final post = provider.posts[i];
                return Column(
                  children: [
                    _buildPost(post),
                  ],
                );
              },
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                post.categoryId.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                post.id.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                post.userId.toString() + '  |  ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(DateTime.parse(post.createdAt)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Divider(),
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
