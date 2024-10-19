import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_articles.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_articles.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';

import '../../../../../core/resources/data_state.dart';
import 'article_event.dart';
import 'article_state.dart';
// import 'locale/local_article_event.dart';

class ArticleBloc extends Bloc<ArticleEvents, ArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  ArticleBloc(this._getArticleUseCase, this._getSavedArticleUseCase,
      this._saveArticleUseCase, this._removeArticleUseCase)
      : super(const ArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  final Connectivity _connectivity = Connectivity();

  void onGetArticles(GetArticles event, Emitter<ArticleState> emit) async {
    final dataSate = await _getArticleUseCase();

    if (dataSate is DataSuccess && dataSate.data!.isNotEmpty) {
      emit(ArticleLoadingDone(dataSate.data!));
    }
    if (dataSate is DataFailed) {
      print(dataSate.error!.message);
      emit(ArticleError(dataSate.error!));
    }
  }

  void onGetSaveArticles(
      GetSevedArticles event, Emitter<ArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(ArticleLoadingDone(articles));
  }

  void onRemoveArticle(
      RemoveArticles removeArticle, Emitter<ArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(ArticleLoadingDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<ArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(ArticleLoadingDone(articles));
  }
}
