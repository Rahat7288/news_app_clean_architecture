import 'package:news_app/core/usecases/use_case.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntities>, void> {
  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntities>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
