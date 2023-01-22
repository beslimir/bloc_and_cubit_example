import 'package:bloc_and_cubit_example/post.dart';
import 'package:bloc_and_cubit_example/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(builder: (context, postsList) {
          if (postsList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(postsList[index].title),
              )
            );
          });
        },
      ),
    );
  }
}