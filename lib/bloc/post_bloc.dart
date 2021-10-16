import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/bloc/post_event.dart';
import 'package:flutter_blog_app/bloc/post_state.dart';
import 'package:flutter_blog_app/model/post_model.dart';
import 'package:flutter_blog_app/service/post_service.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  PostBloc() : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPost){
      List<PostModel> posts = await PostService.getPosts();

      yield PostLoaded(posts: posts);
    }
  }
}