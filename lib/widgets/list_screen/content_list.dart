import 'package:flutter/material.dart';
import 'package:list_app/models/ads_dto.dart';
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/providers/posts_with_ads_provider.dart';
import 'package:list_app/screens/detail_screen.dart';
import 'package:list_app/widgets/list_screen/ads_content.dart';
import 'package:list_app/widgets/list_screen/post_content.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ContentList extends StatelessWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _navigateToDetailScreen(BuildContext context, PostDto post) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => DetailScreen(post)),
    );
  }

  Future<void> _onLoading(
      BuildContext context, PostsWithAdsProvider postsWithAdsProvider) async {
    try {
      await postsWithAdsProvider.setNextContents();
    } on Exception catch (error) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          duration: Duration(milliseconds: 300),
        ),
      );
    } finally {
      _refreshController.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsWithAdsProvider>(
      builder: (ctx, postsWithAdsProvider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              enablePullDown: false,
              onLoading: () => _onLoading(context, postsWithAdsProvider),
              footer: ClassicFooter(
                loadStyle: LoadStyle.ShowWhenLoading,
                completeDuration: Duration(milliseconds: 500),
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: postsWithAdsProvider.contents.length,
                itemBuilder: (ctx, i) {
                  final content = postsWithAdsProvider.contents[i];
                  if (content is AdsDto) return AdsContent(content);
                  return PostContent(_navigateToDetailScreen, content);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
