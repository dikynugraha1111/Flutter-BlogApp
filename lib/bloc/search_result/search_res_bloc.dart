import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../model/search_result.dart';
import '../../network/search_network.dart';

part 'search_res_event.dart';
part 'search_res_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final int _resultAmount = 4;
  int? _currentPage;
  int? _totalPage;
  int? _totalResult;
  String? _searchQuery;

  String? get searchQuery => _searchQuery;
  int get resultAmount => _resultAmount;
  int? get currentPage => _currentPage;
  int? get totalPage => _totalPage;
  int? get totalResult => _totalResult;

  SearchResultBloc() : super(const SearchResultInitial()) {
    on<SearchResultInitialized>(_onInitialized);
    on<SearchResultFetching>(_onFetching);
  }

  List<SearchResult> _jsonToResultList(String json) {
    final bodyJsonData = jsonDecode(json) as List;
    return bodyJsonData.map((e) {
      return SearchResult.fromJson(e);
    }).toList();
  }

  void _onInitialized(
    SearchResultInitialized event,
    Emitter<SearchResultState> emit,
  ) async {
    SearchNetwork _searchService = SearchNetwork();
    emit(const SearchResultInitialLoading());
    Response? _response = await _searchService.getResponse(
      query: event.searchQuery,
      page: '1',
      perPage: '$_resultAmount',
    );
    if (_response == null) {
      emit(const SearchResultError(message: "Something went wrong..."));
    } else {
      final Map<String, String> headersJsonData = _response.headers;
      _totalPage = int.tryParse(headersJsonData["x-wp-totalpages"] ?? '');
      _totalResult = int.tryParse(headersJsonData["x-wp-total"] ?? '');
      _currentPage = 1;
      _searchQuery = event.searchQuery;

      if (_currentPage == _totalPage || _totalResult == 0) {
        emit(SearchResultFinish(
          result: _jsonToResultList(_response.body),
        ));
      } else {
        emit(SearchResultReady(
          result: _jsonToResultList(_response.body),
        ));
      }
    }
  }

  void _onFetching(
    SearchResultFetching event,
    Emitter<SearchResultState> emit,
  ) async {
    if (_currentPage == _totalPage) {
      emit(SearchResultFinish(result: state.result));
      return;
    }
    SearchNetwork _searchService = SearchNetwork();
    emit(SearchResultLazyLoading(
      currentResult: state.result,
    ));
    _currentPage = _currentPage! + 1;
    Response? _response = await _searchService.getResponse(
      query: _searchQuery ?? '',
      page: '$_currentPage',
      perPage: '$_resultAmount',
    );
    if (_response == null) {
      emit(const SearchResultError(message: "Something went wrong..."));
    } else {
      state.result!.addAll(_jsonToResultList(_response.body));
      emit(SearchResultReady(
        result: state.result,
      ));
    }
  }
}
