import 'package:appstore/feature/search/data/model/model_search.dart';
import 'package:appstore/feature/search/presentation/view/widget/custom_itme_search.dart';
import 'package:flutter/material.dart';

class ListSparatSearch extends StatelessWidget {
  const ListSparatSearch(this.data, {super.key});
  final Data data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (contxt, _) {
          return CustomSearchView(data: data.dataList![_]);
        },
        separatorBuilder: (context, _) => const Divider(),
        itemCount: data.dataList!.length);
  }
}
