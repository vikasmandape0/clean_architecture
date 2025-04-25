import 'package:fbtutorial/features/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:fbtutorial/features/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:fbtutorial/features/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("asdf")), body: _buildBody());
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              // return ListTile(title: Text(index.toString()));
              return ArticleWidget(article: state.article![index],);
            },
            itemCount: state.article!.length,
          );
        }
        return SizedBox();
      },
    );
  }
}
