import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/article/article_bloc.dart';
import '../../bloc/article/article_state.dart';

// import '../../bloc/article/remote/remote_article_bloc.dart';
// import '../../bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<ArticleBloc, ArticleState>(builder: (_, state) {
      if (state is ArticleLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ArticleError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is ArticleLoadingDone) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          },
          itemCount: state.articles!.length,
        );
      }
      return const SizedBox();
    });
  }
}
