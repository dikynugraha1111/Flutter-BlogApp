import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/model/post_model.dart';
import 'package:flutter_blog_app/network/post_network.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPost) {
      List<PostModel> posts = await PostNetwork.getPosts();

      yield PostLoaded(posts: posts);
    }
  }
}
