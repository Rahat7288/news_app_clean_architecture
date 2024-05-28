import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_articles.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';

import 'local_article_event.dart';
import 'local_articles.state.dart';

class LocalArticleBloc extends Bloc<LocalArticlesEvents, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._removeArticleUseCase,
    this._saveArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticleUseCase>(onGetSaveArticles);
    on<SaveArticleUseCase>(onSaveArticle);
    on<RemoveArticleUseCase>(onRemoveArticles);
  }

  void onGetSaveArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
      RemoveArticles removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
      SaveArticles saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
