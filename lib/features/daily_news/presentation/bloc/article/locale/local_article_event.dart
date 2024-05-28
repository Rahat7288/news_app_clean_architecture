import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticlesEvents extends Equatable {
  final ArticleEntities? article;
  const LocalArticlesEvents({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticlesEvents {
  const GetSavedArticles();
}

class RemoveArticles extends LocalArticlesEvents {
  const RemoveArticles();
}

class SaveArticles extends LocalArticlesEvents {
  const SaveArticles();
}
