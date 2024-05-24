/*
* when we start working on our project or working on a feature
* we need to start from the entities folder
* what are the entities ???
* entities are business object of an application or a system
* what are the objects we will get when we call an API and getting the response data
* */
import 'package:equatable/equatable.dart';

class ArticleEntities extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntities({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props {
    return [
      id,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}
