import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleEvents {
  final ArticleEntities? article;
  const ArticleEvents({this.article});
}

class GetArticles extends ArticleEvents {
  const GetArticles();
}

class GetSevedArticles extends ArticleEvents {
  const GetSevedArticles();
}

class SaveArticle extends ArticleEvents {
  const SaveArticle(ArticleEntities article) : super(article: article);
}

class RemoveArticles extends ArticleEvents {
  const RemoveArticles(ArticleEntities article) : super(article: article);
}
