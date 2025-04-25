import 'package:fbtutorial/core/resources/data_state.dart';
import 'package:fbtutorial/core/usecases/usecases.dart';
import 'package:fbtutorial/features/domain/entity/article.dart';
import 'package:fbtutorial/features/domain/repository/article_repository.dart';

class GetArticleUsecase implements UseCases<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUsecase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}