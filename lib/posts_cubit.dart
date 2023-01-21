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
