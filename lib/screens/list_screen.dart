import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_app/constants.dart';
import 'package:list_app/providers/posts_with_ads_provider.dart';
import 'package:list_app/widgets/list_screen/content_list.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    Provider.of<PostsWithAdsProvider>(context, listen: false)
        .setContents()
        .then(
          (_) => setState(() {
            _isLoading = false;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _screenSize.width * Constants.bodyWidthPadding),
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ContentList(),
    );
  }
}
