import 'package:flutter/material.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import '../../widgets/search/search_result_tile.dart';
import '../../../bloc/search_result/search_res_bloc.dart';
import 'package:provider/provider.dart';

class SearchResultSection extends StatefulWidget {
  const SearchResultSection({Key? key}) : super(key: key);

  @override
  State<SearchResultSection> createState() => _SearchResultSectionState();
}

class _SearchResultSectionState extends State<SearchResultSection> {
  @override
  Widget build(BuildContext context) {
    SearchResultBloc _repository = context.watch<SearchResultBloc>();

    if (_repository.state is SearchResultReady ||
        _repository.state is SearchResultLazyLoading ||
        _repository.state is SearchResultFinish) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hasil Pencarian: ${_repository.totalResult}",
            style: blackTextFont.copyWith(
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 7),
          ListView.builder(
            shrinkWrap: true,
            itemCount: (_repository.state is SearchResultFinish)
                ? (_repository.state.result!.length)
                : (_repository.state.result!.length + 1),
            itemBuilder: (context, index) {
              if (index >= _repository.state.result!.length) {
                if (_repository.state is! SearchResultLazyLoading) {
                  _repository.add(const SearchResultFetching());
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 6.0,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: SearchResultTile(
                  title: _repository.state.result?[index].title ?? '',
                ),
              );
            },
          ),
        ],
      );
    } else {
      return const CircularProgressIndicator(
        color: Colors.black,
        strokeWidth: 6.0,
      );
    }
  }
}
