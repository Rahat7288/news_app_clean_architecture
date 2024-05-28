import 'package:news_app/core/usecases/use_case.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntities> {
  final ArticleRepository _articleRepository;
  RemoveArticleUseCase(this._articleRepository);
  @override
  Future<void> call({ArticleEntities? params}) {
    return _articleRepository.removeArticles(params!);
  }
}
