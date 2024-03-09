import 'package:appstore/feature/search/presentation/manger/cubit_search/cubit_search.dart';
import 'package:appstore/feature/search/presentation/view/widget/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitSearch(),
      child: const SearchBody(),
    );
  }
}
