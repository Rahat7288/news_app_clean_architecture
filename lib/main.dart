import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/article_bloc.dart';

// import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
// import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';

import 'features/daily_news/presentation/bloc/article/article_event.dart';
import 'features/daily_news/presentation/pages/home/daily_news.dart';
import 'features/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DailyNews(),
      ),
    );
  }
}
