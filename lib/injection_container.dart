import 'package:fbtutorial/features/data/datasource/news_api_service.dart';
import 'package:fbtutorial/features/data/repository/article_repository_impl.dart';
import 'package:fbtutorial/features/domain/repository/article_repository.dart';
import 'package:fbtutorial/features/domain/usecase/get_article_usecase.dart';
import 'package:fbtutorial/features/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<GetArticleUsecase>(GetArticleUsecase(sl()));
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}