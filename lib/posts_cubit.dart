import 'package:bloc_and_cubit_example/data_services.dart';
import 'package:bloc_and_cubit_example/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]); //initial state

  void getPosts() async {
    return emit(await _dataService.getPosts());
  }
}


class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingPostsState()) {
    on((event, emit) async {
      try {
        final posts = await _dataService.getPosts();
        if (event is LoadPostsEvent || event is PullToRefreshEvent) {
          emit(LoadedPostsState(posts: posts));
        }
      } on Error catch (error) {
        emit(FailedPostsState(error: error));
      }
    });
  }
}


abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}


abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Post> posts;
  LoadedPostsState({required this.posts});
}

class FailedPostsState extends PostsState {
  Error error;
  FailedPostsState({required this.error});
}






