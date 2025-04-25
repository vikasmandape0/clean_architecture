import 'package:fbtutorial/core/resources/data_state.dart';
import 'package:fbtutorial/features/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}