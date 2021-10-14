part of 'search_res_bloc.dart';

abstract class SearchResultEvent extends Equatable {
  const SearchResultEvent();

  @override
  List<Object> get props => [];
}

class SearchResultInitialized extends SearchResultEvent {
  final String searchQuery;
  const SearchResultInitialized({required this.searchQuery});

  @override
  List<Object> get props => [searchQuery];
}

class SearchResultFetching extends SearchResultEvent {
  const SearchResultFetching();
}
