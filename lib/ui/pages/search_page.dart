import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import 'package:provider/provider.dart';

import '../../bloc/search_result/search_res_bloc.dart';
import '../widgets/search/search_result_section.dart';
import '../widgets/search/search_text_input.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Page"),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: BlocProvider<SearchResultBloc>(
        create: (_) => SearchResultBloc(),
        child: const SearchView(),
      ),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String _searchQuery = '';

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    SearchResultBloc _repository = context.read<SearchResultBloc>();
    if (_isBottom && _repository is! SearchResultFinish) {
      _repository.add(const SearchResultFetching());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // controller: _scrollController,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SearchTextInput(
              controller: _controller,
              label: "Kata Pencarian",
              valueSetter: (val) async {
                _searchQuery = val ?? '';
                context.read<SearchResultBloc>().add(
                      SearchResultInitialized(
                        searchQuery: _searchQuery,
                      ),
                    );
                setState(() {});
              },
            ),
            const SizedBox(height: 25),
            (_searchQuery != '')
                ? const SearchResultSection()
                : Center(
                    child: Text(
                      "Search something...",
                      style: blackTextFont.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    //context.read<SearchResultBloc>().close();
    _controller.dispose();
    super.dispose();
  }
}
