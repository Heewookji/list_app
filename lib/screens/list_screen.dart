import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/constants.dart';
import 'package:list_app/models/ads_dto.dart';
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/providers/posts_with_ads_provider.dart';
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
      await Provider.of<PostsWithAdsProvider>(context, listen: false)
          .setContents();
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool _fetchNextByScroll(ScrollNotification scrollInfo,
      PostsWithAdsProvider postsWithAdsProvider) {
    if (!_isScrollLoading &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      setState(() {
        _isScrollLoading = true;
      });
      postsWithAdsProvider.setNextContents().then(
            (value) => setState(() {
              _isScrollLoading = false;
            }),
          );
    }
    return true;
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
          : _buildPostAndAdsList(),
    );
  }

  Widget _buildPostAndAdsList() {
    return Consumer<PostsWithAdsProvider>(
      builder: (ctx, postsWithAdsProvider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) =>
                  _fetchNextByScroll(scrollInfo, postsWithAdsProvider),
              child: ListView.builder(
                itemCount: postsWithAdsProvider.contents.length + 1,
                itemBuilder: (ctx, i) {
                  if (i == postsWithAdsProvider.contents.length)
                    return _isScrollLoading
                        ? Center(child: CircularProgressIndicator())
                        : Container();
                  final content = postsWithAdsProvider.contents[i];
                  if (content is AdsDto) return _buildAds(content);
                  return _buildPost(content);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildAds(AdsDto ads) {
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
          Text('Sponsored'),
          Row(
            children: [
              SizedBox(
                width: _screenSize.width * 0.5,
                height: _screenSize.width * 0.4,
                child: Image.network(
                  Constants.imgBaseUrl + ads.img,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: _screenSize.width * 0.36,
                    child: Text(
                      ads.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: _screenSize.height * 0.01),
                  SizedBox(
                    width: _screenSize.width * 0.36,
                    child: Text(
                      ads.contents,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
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
