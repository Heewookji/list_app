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
      margin: EdgeInsets.symmetric(vertical: _screenSize.height * 0.01),
      padding: EdgeInsets.all(_screenSize.width * 0.05),
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
                    width: _screenSize.width * 0.3,
                    child: Text(
                      ads.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: _screenSize.height * 0.01),
                  SizedBox(
                    width: _screenSize.width * 0.3,
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
}
