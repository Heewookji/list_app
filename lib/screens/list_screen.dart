import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_app/constants.dart';
import 'package:list_app/providers/posts_with_ads_provider.dart';
import 'package:list_app/widgets/list_screen/content_list.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _screenSize.width * Constants.bodyWidthPadding),
      child: FutureBuilder<void>(
        future: Provider.of<PostsWithAdsProvider>(context, listen: false)
            .setContents(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return ContentList();
        },
      ),
    );
  }
}
