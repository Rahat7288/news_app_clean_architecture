import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/article.dart';

abstract class ArticleState extends Equatable {
  final List<ArticleEntities>? articles;
  final DioException? error;

  const ArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class ArticleLoading extends ArticleState {
  const ArticleLoading();
}

class ArticleLoadingDone extends ArticleState {
  const ArticleLoadingDone(List<ArticleEntities> articles)
      : super(articles: articles);
}

class ArticleError extends ArticleState {
  const ArticleError(DioException error) : super(error: error);
}
