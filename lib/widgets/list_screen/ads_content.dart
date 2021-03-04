import 'package:flutter/material.dart';
import 'package:list_app/models/ads_dto.dart';

import '../../constants.dart';

class AdsContent extends StatelessWidget {
  final AdsDto ads;

  AdsContent(this.ads);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _screenSize = MediaQuery.of(context).size;
    return Container(
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
          Text('Sponsored'),
          SizedBox(
            height: _screenSize.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildImage(_screenSize),
              SizedBox(
                width: _screenSize.height * 0.02,
              ),
              _buildText(_theme, _screenSize),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildImage(Size _screenSize) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SizedBox(
          width: _screenSize.width * 0.4,
          height: _screenSize.width * 0.3,
          child: Image.network(
            Constants.imgBaseUrl + ads.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Expanded _buildText(ThemeData _theme, Size _screenSize) {
    return Expanded(
      child: Column(
        children: [
          Text(
            ads.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: _theme.textTheme.bodyText1,
          ),
          SizedBox(
            height: _screenSize.height * 0.01,
          ),
          Text(
            ads.contents,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: _theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
