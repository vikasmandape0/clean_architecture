import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbtutorial/features/domain/entity/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  const ArticleWidget({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [_buildImage(context), _buildTitleAndDescription()]),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article!.urlToImage ?? "https://sketchok.com/images/articles/06-anime/015-dragon-ball/13/17.jpg",
      imageBuilder: (context, imageProvider) {
        return Padding(
          padding: EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(image: imageProvider),
              ),
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Padding(
          padding: EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              child: CupertinoActivityIndicator(),
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Column(
        children: [
          Text(article!.title ?? "no data"),
          Text(article!.description ?? "no data"),
          Row(children: [Text(article!.publishedAt ?? "no data"), ]),
        ],
      ),
    );
  }
}
