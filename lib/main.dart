import 'package:fbtutorial/config/themes/app_theme.dart';
import 'package:fbtutorial/features/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:fbtutorial/features/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:fbtutorial/features/presentation/pages/home/daily_news.dart';
import 'package:fbtutorial/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: DailyNews(),
      ),
    );
  }
}