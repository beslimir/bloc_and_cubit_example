import 'package:bloc_and_cubit_example/posts_cubit.dart';
import 'package:bloc_and_cubit_example/posts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostsCubit>(
        create: (_) => PostsCubit()..getPosts(),
        child: PostsView(),
      )
    );
  }
}

