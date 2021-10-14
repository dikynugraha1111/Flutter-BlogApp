part of 'search_res_bloc.dart';

abstract class SearchResultState extends Equatable {
  final List<SearchResult>? result;
  const SearchResultState(this.result);

  @override
  get props => [result];
}

class SearchResultInitial extends SearchResultState {
  const SearchResultInitial() : super(null);
}

class SearchResultInitialLoading extends SearchResultState {
  const SearchResultInitialLoading() : super(null);
}

class SearchResultLazyLoading extends SearchResultState {
  const SearchResultLazyLoading({
    List<SearchResult>? currentResult,
  }) : super(currentResult);
}

class SearchResultReady extends SearchResultState {
  const SearchResultReady({
    List<SearchResult>? result,
  }) : super(result);
}

class SearchResultFinish extends SearchResultState {
  const SearchResultFinish({
    List<SearchResult>? result,
  }) : super(result);
}

class SearchResultError extends SearchResultState {
  final String message;
  const SearchResultError({required this.message}) : super(null);

  @override
  get props => [message];
}
