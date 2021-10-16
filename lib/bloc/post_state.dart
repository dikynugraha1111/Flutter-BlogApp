import 'package:equatable/equatable.dart';
import 'package:flutter_blog_app/model/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object?> get props => [];
}

class PostLoaded extends PostState {
  final List<PostModel> posts;

  PostLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}
