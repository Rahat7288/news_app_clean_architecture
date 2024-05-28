/*
* repository inside the domain layer works as a bridge between data layer and domain layer
*
* */

import 'package:news_app/features/daily_news/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntities>>> getNewsArticles();
//   Database methods
  Future<List<ArticleEntities>> getSavedArticles();
  Future<void> saveArticles(ArticleEntities articleEntities);
  Future<void> removeArticles(ArticleEntities articleEntities);
}
